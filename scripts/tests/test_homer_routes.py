"""Render the real Go template with dummy keys and check its security boundaries.

Requires Go and Ruby (standard-library YAML parser); no external packages.
Run: python3 -m unittest discover -s scripts/tests -p test_homer_routes.py
"""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[2]
RENDERER = r'''
package main
import ("os"; "text/template"; "fmt")
func main() {
  funcs := template.FuncMap{
    "env": os.Getenv,
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

    def render(self, homeassistant="test-ha"):
        env = dict(os.environ, DOMAINNAME_CLOUD_SERVER="example.test",
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
        config = self.render('dummy-"quoted"-key')
        self.assertEqual(config["routers"]["homer-homeassistant-rtr"]["middlewares"],
                         ["chain-authelia@file", "homer-homeassistant-strip@file",
                          "homer-homeassistant-key@file"])
        ha = config["middlewares"]["homer-homeassistant-key"]["headers"]["customRequestHeaders"]
        self.assertEqual(ha, {"Authorization": 'Bearer dummy-"quoted"-key',
                             "X-API-Key": "", "Cookie": ""})

    def test_missing_key_removes_only_its_route(self):
        for key in ("", "present"):
            config = self.render(key)
            self.assertEqual("homer-homeassistant-rtr" in config["routers"], bool(key))
            self.assertEqual("homer-homeassistant-key" in config["middlewares"], bool(key))
            self.assertIn("homer-traefik-rtr", config["routers"])
            self.assertIn("homer-rss-rtr", config["routers"])

    def test_other_sensitive_routes_stay_exact(self):
        routers = self.render()["routers"]
        for name, path in (("homeassistant", "/services/homeassistant/api/"),
                           ("traefik", "/services/traefik/api/version")):
            self.assertEqual(routers[f"homer-{name}-rtr"]["rule"],
                             f'Host(`home.example.test`) && Path(`{path}`) && Method(`GET`)')


if __name__ == "__main__":
    unittest.main()
