"""Exercise deployment commands without accessing Docker or repository secrets."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

SCRIPTS = Path(__file__).resolve().parents[1]
MODEL = {"name": "homeserver-docker", "services": {
    "traefik": {"image": "example/proxy:v1@sha256:abc"},
    "scheduler": {"image": "example/scheduler:v1"},
    "scheduler-socket-proxy": {"image": "example/socket:v1"},
    "libation": {"profiles": ["scheduled"], "image": "example/job:v1"},
    "portainer": {"profiles": ["portainer"]},
    "socket-proxy": {"profiles": ["portainer"]},
    "resource-monitor": {"profiles": ["diagnostics"]},
    "esphome": {"profiles": ["disabled"]},
}}
DOCKER = '''#!/usr/bin/env python3
import json, os, sys
from pathlib import Path
args = sys.argv[1:]
with open(os.environ["CALLS"], "a") as f:
    f.write(json.dumps(args) + "\\n")
if "version" in args:
    print(os.environ.get("COMPOSE_TEST_VERSION", "2.40.3"))
elif "config" in args:
    if "-" in args:
        sys.stdin.read()
        print(json.dumps({"services": {"registry-credentials": {"environment": {
            "GITHUB_USERNAME": "test", "GITHUB_TOKEN": "test-token"}}}}))
    else:
        if os.environ.get("CONFIG_FAIL") == "1": sys.exit(1)
        print(Path(os.environ["MODEL"]).read_text())
elif args[0] == "login":
    sys.stdin.read()
elif "pull" in args and os.environ.get("PULL_FAIL") == "1":
    sys.exit(1)
elif "ps" in args:
    if args[-1] == "scheduler" and os.environ.get("SCHEDULER", "running") == "running":
        print("scheduler-id")
    elif args[-1] == "libation":
        print("job-id")
    elif args[-1] == "traefik" and os.environ.get("TRAEFIK_RUNNING", "true") == "true":
        print("traefik-id")
elif args[0] == "inspect":
    if args[-1] == "traefik-id":
        print(os.environ.get("TRAEFIK_STARTED", "2025-01-01T00:00:00.500000000Z"))
    else:
        print(os.environ.get("JOB_RUNNING", "false"))
elif "--no-start" in args and os.environ.get("CREATE_FAIL") == "1":
    sys.exit(1)
elif "--force-recreate" in args and os.environ.get("RECREATE_FAIL") == "1":
    sys.exit(1)
'''


class ComposeScripts(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        (self.root / "scripts").mkdir()
        for name in ("compose-common.bash", "portainer.bash", "update-docker-compose-services.bash", "esphome-clean.sh"):
            shutil.copyfile(SCRIPTS / name, self.root / "scripts" / name)
        (self.root / "scripts/.env").write_text("")
        (self.root / "compose.yaml").write_text("name: homeserver-docker\n")
        self.bin = self.root / "bin"
        self.bin.mkdir()
        docker = self.bin / "docker"
        docker.write_text(DOCKER)
        docker.chmod(0o755)
        self.model = self.root / "model.json"
        self.model.write_text(json.dumps(MODEL))
        self.log = self.root / "calls.jsonl"
        self.env = dict(os.environ, PATH=f"{self.bin}:{os.environ['PATH']}",
                        MODEL=str(self.model), CALLS=str(self.log), COMPOSE_PROFILES="diagnostics")

    def run_script(self, script, *args, **env):
        return subprocess.run(["bash", str(self.root / "scripts" / script), *args],
                              cwd=self.bin, env=dict(self.env, **env),
                              capture_output=True, text=True)

    def calls(self):
        return [json.loads(line) for line in self.log.read_text().splitlines()]

    def actions(self, command):
        return [c[c.index(command):] for c in self.calls() if command in c]

    def test_portainer_group_is_dynamic_and_repeatable(self):
        model = json.loads(self.model.read_text())
        model["services"]["extra-debug-tool"] = {"profiles": ["portainer"]}
        self.model.write_text(json.dumps(model))
        for action in ("start", "start", "stop", "stop"):
            result = self.run_script("portainer.bash", action)
            self.assertEqual(result.returncode, 0, result.stderr)
        for call in self.actions("up"):
            self.assertEqual(set(call[2:]), {"portainer", "socket-proxy", "extra-debug-tool"})
        for call in self.actions("stop"):
            self.assertEqual(set(call[1:]), {"portainer", "socket-proxy", "extra-debug-tool"})
        for call in self.calls():
            if "version" not in call:
                self.assertIn(str(self.root / "compose.yaml"), call)

    def test_portainer_empty_group_fails_without_mutation(self):
        self.model.write_text('{"services": {}}')
        self.assertNotEqual(self.run_script("portainer.bash", "start").returncode, 0)
        self.assertFalse(self.actions("up"))

    def test_config_failure_fails_without_mutation(self):
        for script, args in (("portainer.bash", ["stop"]), ("update-docker-compose-services.bash", [])):
            self.assertNotEqual(self.run_script(script, *args, CONFIG_FAIL="1").returncode, 0)
        self.assertTrue(all("config" in c or "version" in c for c in self.calls()))

    def test_old_compose_rejected_before_actions(self):
        result = self.run_script("portainer.bash", "start", COMPOSE_TEST_VERSION="2.20.0")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("2.40.3+", result.stderr)
        self.assertEqual(self.calls(), [["compose", "version", "--short"]])

    def test_update_prepares_job_before_start_and_excludes_optional(self):
        result = self.run_script("update-docker-compose-services.bash")
        self.assertEqual(result.returncode, 0, result.stderr)
        expected = {"traefik", "scheduler", "scheduler-socket-proxy"}
        self.assertEqual(set(self.actions("pull")[0][1:]), expected | {"libation"})
        self.assertEqual(self.actions("up"), [
            ["up", "--no-start", "--no-deps", "libation"],
            ["up", "-d", "--remove-orphans", "traefik", "scheduler", "scheduler-socket-proxy"]])
        calls = self.calls()
        self.assertLess(next(i for i,c in enumerate(calls) if "pull" in c),
                        next(i for i,c in enumerate(calls) if "stop" in c))
        for c in calls:
            if "--remove-orphans" in c:
                self.assertIn("*", c)  # Optional containers stay known, never orphans.
        self.assertIn(["tag", "example/proxy@sha256:abc", "example/proxy:v1"], calls)
        self.assertFalse(self.actions("start"))

    def test_active_job_defers_and_restores_scheduler(self):
        result = self.run_script("update-docker-compose-services.bash", JOB_RUNNING="true")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(self.actions("up"))
        self.assertIn(["start", "scheduler-id"], self.calls())
        self.assertFalse(self.actions("prune"))

    def test_failed_job_creation_restores_scheduler(self):
        self.assertNotEqual(self.run_script("update-docker-compose-services.bash", CREATE_FAIL="1").returncode, 0)
        self.assertIn(["start", "scheduler-id"], self.calls())
        self.assertFalse(any("-d" in c for c in self.actions("up")))

    def test_failure_does_not_start_previously_stopped_scheduler(self):
        self.assertNotEqual(self.run_script("update-docker-compose-services.bash", CREATE_FAIL="1",
                                            SCHEDULER="stopped").returncode, 0)
        self.assertFalse(self.actions("start"))

    def test_pull_failure_leaves_services_alone(self):
        self.assertNotEqual(self.run_script("update-docker-compose-services.bash", PULL_FAIL="1").returncode, 0)
        self.assertFalse(self.actions("stop"))
        self.assertFalse(self.actions("up"))

    def plugin_mount(self):
        directory = self.root / "plugin source/nested"
        directory.mkdir(parents=True)
        source = directory / "plugin.go"
        source.write_text("package plugin\n")
        self.plugin_old_ns = 1735689600_000000000  # 2025-01-01 UTC
        for entry in (source, directory, directory.parent):
            os.utime(entry, ns=(self.plugin_old_ns, self.plugin_old_ns))
        model = json.loads(self.model.read_text())
        model["services"]["traefik"]["volumes"] = [
            {"type": "bind", "source": str(directory.parent),
             "target": "/plugins-local/src/example/plugin"},
            {"type": "bind", "source": "/unrelated/missing", "target": "/rules"}]
        self.model.write_text(json.dumps(model))
        return source

    def test_newer_plugin_recreates_only_traefik_after_normal_update(self):
        source = self.plugin_mount()
        os.utime(source, ns=(self.plugin_old_ns + 900000000,) * 2)
        result = self.run_script("update-docker-compose-services.bash")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(self.actions("up")[-1],
                         ["up", "-d", "--no-deps", "--force-recreate", "traefik"])
        calls = self.calls()
        update = next(i for i, c in enumerate(calls) if "--remove-orphans" in c)
        inspect = next(i for i, c in enumerate(calls) if c[-1] == "traefik-id")
        self.assertLess(update, inspect)
        self.assertIn("at or after Traefik", result.stdout)

    def test_older_plugin_does_not_recreate(self):
        source = self.plugin_mount()
        for ns in (self.plugin_old_ns, self.plugin_old_ns + 500000000):
            os.utime(source, ns=(ns, ns))
            result = self.run_script("update-docker-compose-services.bash",
                                     TRAEFIK_STARTED="2025-01-01T00:00:01.500000000Z")
            self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any("--force-recreate" in c for c in self.calls()))

    def test_startup_second_conservatively_recreates(self):
        self.plugin_mount()
        result = self.run_script("update-docker-compose-services.bash")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("--force-recreate", self.actions("up")[-1])

    @unittest.skipUnless(shutil.which("gstat") and shutil.which("gfind"), "GNU tools not separately installed")
    def test_plugin_check_with_gnu_find_and_stat(self):
        (self.bin / "stat").symlink_to(shutil.which("gstat"))
        (self.bin / "find").symlink_to(shutil.which("gfind"))
        self.test_newer_plugin_recreates_only_traefik_after_normal_update()

    def test_plugin_stat_failure_stops_update(self):
        self.plugin_mount()
        stat = self.bin / "stat"
        stat.write_text('#!/bin/sh\nif [ "$3" = / ]; then exit 0; fi\nexit 1\n')
        stat.chmod(0o755)
        result = self.run_script("update-docker-compose-services.bash")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(any("--force-recreate" in c for c in self.calls()))
        self.assertFalse(self.actions("prune"))

    def test_already_restarted_traefik_does_not_recreate_again(self):
        source = self.plugin_mount()
        os.utime(source, ns=(self.plugin_old_ns + 900000000,) * 2)
        result = self.run_script("update-docker-compose-services.bash",
                                 TRAEFIK_STARTED="2025-01-01T00:00:01Z")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertFalse(any("--force-recreate" in c for c in self.calls()))

    def test_deleted_plugin_file_recreates_from_directory_mtime(self):
        source = self.plugin_mount()
        source.unlink()
        result = self.run_script("update-docker-compose-services.bash")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("--force-recreate", self.actions("up")[-1])

    def test_missing_mount_or_invalid_start_time_fails_without_recreation(self):
        source = self.plugin_mount()
        result = self.run_script("update-docker-compose-services.bash", TRAEFIK_STARTED="invalid")
        self.assertNotEqual(result.returncode, 0)
        source.unlink()
        source.parent.rmdir()
        source.parent.parent.rmdir()
        result = self.run_script("update-docker-compose-services.bash")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(any("--force-recreate" in c for c in self.calls()))
        self.assertFalse(self.actions("prune"))

    def test_plugin_recreation_failure_stops_cleanup(self):
        source = self.plugin_mount()
        os.utime(source, ns=(self.plugin_old_ns + 900000000,) * 2)
        result = self.run_script("update-docker-compose-services.bash", RECREATE_FAIL="1")
        self.assertNotEqual(result.returncode, 0)
        self.assertFalse(self.actions("prune"))
        self.assertFalse(self.actions("start"))

    def test_stopped_traefik_is_reported(self):
        self.plugin_mount()
        result = self.run_script("update-docker-compose-services.bash", TRAEFIK_RUNNING="false")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("Traefik is not running", result.stderr)
        self.assertFalse(any("--force-recreate" in c for c in self.calls()))

    def esphome_config(self):
        config = self.root / "host volume/esphome/config"
        config.mkdir(parents=True)
        model = json.loads(self.model.read_text())
        model["services"]["esphome"]["volumes"] = [
            {"type": "bind", "source": str(config), "target": "/config"}]
        self.model.write_text(json.dumps(model))
        return config

    def test_esphome_cleans_only_caches_from_resolved_mount(self):
        config = self.esphome_config()
        cache = config / ".esphome"
        for name in ("build", "external_components", "idedata", "packages", "platformio"):
            (cache / name).mkdir(parents=True)
            (cache / name / "artifact").write_text("cache")
        (config / "device.yaml").write_text("keep")
        (config / "secrets.yaml").write_text("keep")
        (cache / "storage").mkdir()
        result = self.run_script("esphome-clean.sh")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(list(cache.iterdir()), [cache / "storage"])
        self.assertTrue((config / "device.yaml").exists())
        self.assertTrue((config / "secrets.yaml").exists())
        self.assertIn(str(self.root / ".env"), self.calls()[-1])

    def test_esphome_refuses_symlinked_cache_directory(self):
        config = self.esphome_config()
        elsewhere = self.root / "elsewhere"
        (elsewhere / "build").mkdir(parents=True)
        (config / ".esphome").symlink_to(elsewhere, target_is_directory=True)
        self.assertNotEqual(self.run_script("esphome-clean.sh").returncode, 0)
        self.assertTrue((elsewhere / "build").exists())

    def test_esphome_missing_mount_fails_without_cleanup(self):
        self.assertNotEqual(self.run_script("esphome-clean.sh").returncode, 0)

    def test_esphome_absent_caches_are_a_noop(self):
        self.esphome_config()
        result = self.run_script("esphome-clean.sh")
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn("No ESPHome caches", result.stdout)


if __name__ == "__main__":
    unittest.main()
