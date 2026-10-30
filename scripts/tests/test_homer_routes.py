"""Render the real Go template with dummy keys and check its security boundaries.

Requires Go and Ruby (standard-library YAML parser); no external packages.
Run: python3 -m unittest discover -s scripts/tests -p test_homer_routes.py
"""
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
RENDERER = r'''
package main
import ("os"; "text/template"; "fmt"; "regexp")
func main() {
  funcs := template.FuncMap{
    "env": os.Getenv,
    "regexQuoteMeta": regexp.QuoteMeta,
    "dict": func(args ...any) (map[string]any, error) {
      if len(args)%2 != 0 { return nil, fmt.Errorf("odd dict arguments") }
      result := map[string]any{}
      for i:=0; i<len(args); i+=2 { result[args[i].(string)] = args[i+1] }
      return result, nil
    },
  }
  data, err := os.ReadFile(os.Args[1]); if err != nil { panic(err) }
  t, err := template.New("rules").Funcs(funcs).Parse(string(data))
  if err != nil { panic(err) }
  if err := t.Execute(os.Stdout, nil); err != nil { panic(err) }
}
'''


class HomerRoutesTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.temp = tempfile.TemporaryDirectory(prefix="homer-routes-")
        cls.addClassCleanup(cls.temp.cleanup)
        directory = Path(cls.temp.name)
        source = directory / "render.go"
        source.write_text(RENDERER)
        cls.binary = directory / "render"
        env = dict(os.environ, GOCACHE=str(directory / "cache"))
        subprocess.run(["go", "build", "-o", str(cls.binary), str(source)],
                       env=env, check=True, capture_output=True)

    def render(self, portainer="test-portainer", homeassistant="test-ha"):
        env = dict(os.environ, DOMAINNAME_CLOUD_SERVER="example.test",
                   HOMER_PORTAINER_API_KEY=portainer,
                   HOMER_HOMEASSISTANT_TOKEN=homeassistant)
        rendered = subprocess.check_output(
            [str(self.binary), str(ROOT / "config/traefik/rules/homer-api.yml")],
            env=env, text=True)
        parsed = subprocess.check_output(
            ["ruby", "-ryaml", "-rjson", "-e",
             "puts JSON.generate(YAML.safe_load(STDIN.read))"],
            input=rendered, text=True)
        return json.loads(parsed)["http"]

    def test_credentials_follow_auth_and_strip(self):
        config = self.render('dummy-"quoted"-key', "test-ha")
        for name in ("portainer", "homeassistant"):
            self.assertEqual(config["routers"][f"homer-{name}-rtr"]["middlewares"],
                             ["chain-authelia@file", f"homer-{name}-strip@file",
                              f"homer-{name}-key@file"])
        portainer = config["middlewares"]["homer-portainer-key"]["headers"]["customRequestHeaders"]
        self.assertEqual(portainer, {"X-API-Key": 'dummy-"quoted"-key',
                                     "Authorization": "", "Cookie": ""})
        ha = config["middlewares"]["homer-homeassistant-key"]["headers"]["customRequestHeaders"]
        self.assertEqual(ha, {"Authorization": "Bearer test-ha", "X-API-Key": "", "Cookie": ""})

    def test_missing_keys_remove_only_their_routes(self):
        for portainer, ha in (("", ""), ("", "present"), ("present", "")):
            config = self.render(portainer, ha)
            for name, key in (("portainer", portainer), ("homeassistant", ha)):
                self.assertEqual(f"homer-{name}-rtr" in config["routers"], bool(key))
                self.assertEqual(f"homer-{name}-key" in config["middlewares"], bool(key))
            self.assertIn("homer-traefik-rtr", config["routers"])
            self.assertIn("homer-rss-rtr", config["routers"])

    def test_portainer_path_allowlist(self):
        rule = self.render()["routers"]["homer-portainer-rtr"]["rule"]
        self.assertTrue(rule.startswith('Host(`home.example.test`) && '))
        self.assertTrue(rule.endswith(' && Method(`GET`)'))
        self.assertNotIn("PathPrefix", rule)
        exact = re.findall(r"Path\(`([^`]+)`\)", rule)
        self.assertEqual(exact, [])
        patterns = re.findall(r"PathRegexp\(`([^`]+)`\)", rule)
        self.assertEqual(len(patterns), 1)
        allowed = re.compile(patterns[0])
        self.assertTrue(patterns[0].startswith("^"))
        self.assertTrue(patterns[0].endswith("$"))
        for path in ("/services/portainer/api/status", "/services/portainer/api/endpoints",
                     "/services/portainer/api/endpoints/12/docker/containers/json"):
            self.assertIsNotNone(allowed.search(path))
        for path in ("/extra/services/portainer/api/status",
                     "/services/portainer/api/status/extra",
                     "/services/portainer/api/endpoints/12",
                     "/services/portainer/api/endpoints/12/docker/containers/json/extra",
                     "/services/portainer/api/endpoints/12/docker/containers/abc/json",
                     "/services/portainer/api/endpoints/12/docker/containers/abc/logs",
                     "/services/portainer/api/endpoints/12/docker/containers/abc/exec",
                     "/services/portainer/api/endpoints/../docker/containers/json"):
            self.assertIsNone(allowed.search(path))

    def test_other_sensitive_routes_stay_exact(self):
        routers = self.render()["routers"]
        for name, path in (("homeassistant", "/services/homeassistant/api/"),
                           ("traefik", "/services/traefik/api/version")):
            self.assertEqual(routers[f"homer-{name}-rtr"]["rule"],
                             f'Host(`home.example.test`) && Path(`{path}`) && Method(`GET`)')


if __name__ == "__main__":
    unittest.main()
