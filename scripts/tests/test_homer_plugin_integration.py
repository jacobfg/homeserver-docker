"""Opt-in test using the production Traefik image and an isolated mock backend.

RUN_HOMER_INTEGRATION=1 python3 -m unittest discover -s scripts/tests -p test_homer_plugin_integration.py
Requires Go, Docker Compose and a running Docker daemon. No live services/configs.
"""
import gzip
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import time
import unittest
import urllib.error
import urllib.request

ROOT = Path(__file__).resolve().parents[2]
BACKEND = r'''
package main
import ("net/http"; "strings")
func main() {
  http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    if r.URL.Path == "/auth" {
      cookie, err := r.Cookie("test-user")
      if err != nil { w.WriteHeader(401); return }
      w.Header().Set("Remote-User", cookie.Value)
      return
    }
    w.Header().Set("Content-Type", "text/plain")
    w.Header().Set("Cache-Control", "public, max-age=3600")
    switch r.URL.Path {
    case "/assets/config.alice.yml":
      w.Write([]byte("title: Alice\n#" + strings.Repeat("x", 4096)))
    case "/assets/config.yml":
      w.Write([]byte("title: Default\n#" + strings.Repeat("x", 4096)))
    case "/assets/config.forbidden.yml":
      w.Header().Set("X-Discarded", "yes")
      http.Error(w, "forbidden", 403)
    case "/assets/config.error.yml": w.WriteHeader(503)
    default: w.Header().Set("X-Discarded", "yes"); http.NotFound(w, r)
    }
  })
  http.ListenAndServe(":8080", nil)
}
'''


@unittest.skipUnless(os.environ.get("RUN_HOMER_INTEGRATION") == "1", "opt-in Docker integration")
class HomerPluginIntegrationTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="homer-plugin-")
        cls.addClassCleanup(cls.temp.cleanup)
        directory = Path(cls.temp.name)
        image = re.search(r"image: (traefik:\S+)", (ROOT / "compose/ingress.yml").read_text())[1]
        architecture = subprocess.check_output(
            ["docker", "info", "--format", "{{.Architecture}}"], text=True).strip()
        architecture = {"aarch64": "arm64", "x86_64": "amd64"}.get(architecture, architecture)
        source = directory / "backend.go"
        source.write_text(BACKEND)
        subprocess.run(["go", "build", "-o", str(directory / "backend"), str(source)],
                       env=dict(os.environ, GOOS="linux", GOARCH=architecture, CGO_ENABLED="0",
                                GOCACHE=str(directory / "cache")), check=True)
        # Reuse the actual production middleware chain; only auth's address is mocked.
        middlewares = (ROOT / "config/traefik/rules/middlewares.yml").read_text()
        middlewares = middlewares.replace("http://authelia:9091/api/authz/forward-auth", "http://backend:8080/auth")
        (directory / "middlewares.yml").write_text(middlewares)
        (directory / "routes.yml").write_text('''http:
  routers:
    homer:
      rule: PathPrefix(`/`)
      middlewares: [chain-homer]
      service: homer
  services:
    homer:
      loadBalancer:
        servers:
          - url: http://backend:8080
''')
        project = "homer-plugin-" + str(os.getpid())
        config = {"services": {
            "backend": {"image": image, "entrypoint": ["/backend"],
                        "volumes": [f"{directory}/backend:/backend:ro"]},
            "traefik": {"image": image, "user": "65532:65532", "read_only": True,
                        "command": ["--entrypoints.web.address=:8080", "--providers.file.directory=/rules",
                                    "--experimental.localplugins.homerconfig.modulename=github.com/jacobfg/homerconfig"],
                        "ports": ["127.0.0.1::8080"],
                        "volumes": [f"{ROOT}/plugins/homerconfig:/plugins-local/src/github.com/jacobfg/homerconfig:ro",
                                    f"{ROOT}/config/traefik/rules/middlewares-chains.yml:/rules/chains.yml:ro",
                                    f"{directory}/middlewares.yml:/rules/middlewares.yml:ro",
                                    f"{directory}/routes.yml:/rules/routes.yml:ro"]}}}
        compose = directory / "compose.json"
        compose.write_text(json.dumps(config))
        cls.command = ["docker", "compose", "-p", project, "-f", str(compose)]
        cls.addClassCleanup(lambda: subprocess.run(cls.command + ["down", "--volumes"], check=False))
        subprocess.run(cls.command + ["up", "-d"], check=True)
        address = subprocess.check_output(cls.command + ["port", "traefik", "8080"], text=True).strip()
        cls.base = "http://" + address
        for _ in range(60):
            try:
                if cls.fetch("/assets/config.yml", "alice")[0] == 200:
                    return
            except OSError:
                pass
            time.sleep(0.5)
        logs = subprocess.check_output(cls.command + ["logs", "traefik"], text=True)
        raise AssertionError("Traefik/plugin failed to become ready:\n" + logs)

    @classmethod
    def fetch(cls, path, user=None, method="GET", **headers):
        if user:
            headers["Cookie"] = "test-user=" + user
        request = urllib.request.Request(cls.base + path, headers=headers, method=method)
        try:
            response = urllib.request.urlopen(request, timeout=3)
        except urllib.error.HTTPError as error:
            response = error
        with response:
            body = response.read()
            if body and response.headers.get("Content-Encoding") == "gzip":
                body = gzip.decompress(body)
            return response.status, response.headers, body

    def test_selection_fallback_auth_and_compression(self):
        for user, title in (("alice", b"title: Alice"), ("bob", b"title: Default"),
                            ("forbidden", b"title: Default")):
            status, headers, body = self.fetch("/assets/config.yml?v=1", user,
                                               **{"Accept-Encoding": "gzip", "Remote-User": "error",
                                                  "If-None-Match": "old", "Range": "bytes=0-1"})
            self.assertEqual(status, 200)
            self.assertTrue(body.startswith(title))
            self.assertEqual(headers.get("Cache-Control"), "private, no-store")
            self.assertEqual(headers.get("Content-Encoding"), "gzip")
            self.assertIsNone(headers.get("X-Discarded"))
            self.assertEqual(self.fetch("/assets/config.yml", user, "HEAD")[2], b"")
        self.assertEqual(self.fetch("/assets/config.yml", "error")[0], 503)
        self.assertEqual(self.fetch("/assets/config.yml", **{"Remote-User": "alice"})[0], 401)
        for path in ("/assets/config.alice.yml", "/assets/config%2ealice.yml"):
            self.assertEqual(self.fetch(path, "bob")[0], 404)
        self.assertEqual(self.fetch("/assets/config.yaml", "alice")[0], 404)


if __name__ == "__main__":
    unittest.main()
