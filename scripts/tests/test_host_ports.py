"""Test Linux procfs command lookup without requiring Linux or root."""
from pathlib import Path
import os
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).resolve().parents[1] / "host-open-ipv4-ports.bash"


class ProcessCommand(unittest.TestCase):
    def lookup(self, pid, proc_root):
        result = subprocess.run(
            ["bash", "-c", 'source "$1"; get_process_command "$2" "$3"',
             "test", str(SCRIPT), pid, str(proc_root)],
            capture_output=True, text=True, check=True,
        )
        self.assertEqual(result.stderr, "")
        return result.stdout.rstrip("\n")

    def test_command_with_spaces_is_preserved(self):
        with tempfile.TemporaryDirectory() as proc_root:
            process = Path(proc_root) / "123"
            process.mkdir()
            (process / "comm").write_text("worker thread\n")
            self.assertEqual(self.lookup("123", proc_root), "worker thread")

    def test_exited_process(self):
        with tempfile.TemporaryDirectory() as proc_root:
            self.assertEqual(self.lookup("123", proc_root), "-")

    def test_missing_or_invalid_pid(self):
        with tempfile.TemporaryDirectory() as proc_root:
            for pid in ("", "-", "users:((worker))", "../123"):
                with self.subTest(pid=pid):
                    self.assertEqual(self.lookup(pid, proc_root), "-")


class ContainerLookup(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.proc = Path(self.tmp.name)
        self.container_id = "a" * 64
        self.process(1, "init", namespace="pid:[1]")
        self.process(100, "python3", namespace="pid:[100]")
        self.snapshot = (
            f"container|{self.container_id}|/homeassistant|100\n"
            "container|" + "b" * 64 + "|/blocky|200\n"
            "port|/blocky|53/tcp|127.0.0.1:53\n"
            "port|/blocky|53/tcp|0.0.0.0:53\n"
            "port|/blocky|53/udp|0.0.0.0:53\n"
        )

    def process(self, pid, command, cgroup="0::/\n", namespace="pid:[1]"):
        directory = self.proc / str(pid)
        (directory / "ns").mkdir(parents=True)
        (directory / "comm").write_text(command + "\n")
        (directory / "cgroup").write_text(cgroup)
        (directory / "ns/pid").symlink_to(namespace)

    def lookup(self, pid, address="0.0.0.0:8123", proto="tcp"):
        # Mock Docker only; use actual procfs-style files and namespace symlinks.
        result = subprocess.run([
            "bash", "-c",
            'source "$1"; docker() { if [[ "$1" == ps ]]; then echo container-id; else printf "%s" "$SNAPSHOT"; fi; }; load_container_data "$2"; get_container_name "$3" "$4" "$5" "$2"',
            "test", str(SCRIPT), str(self.proc), str(pid), address, proto,
        ], env={**os.environ, "SNAPSHOT": self.snapshot},
            capture_output=True, text=True, check=True)
        self.assertEqual(result.stderr, "")
        return result.stdout.strip()

    def test_proxy_matches_all_bindings_and_protocols_without_systemd(self):
        self.process(300, "docker-proxy")
        for proto in ("tcp", "udp"):
            self.assertEqual(self.lookup(300, "0.0.0.0:53", proto), "blocky")
        self.assertEqual(self.lookup(300, "0.0.0.0:530", "tcp"), "-")

    def test_external_container_with_remapped_loopback_ssh_port(self):
        self.snapshot += "container|" + "c" * 64 + "|/management|700\n"
        self.snapshot += "port|/management|22/tcp|127.0.0.1:2222\n"
        self.process(701, "docker-proxy")
        self.assertEqual(self.lookup(701, "127.0.0.1:2222"), "management")
        self.assertEqual(self.lookup(701, "127.0.0.1:22"), "-")

    def test_socket_scan_includes_loopback(self):
        result = subprocess.run([
            "bash", "-c", '''
source "$1"
ss() {
  [[ "$*" == '-utnlp4' ]] || return 1
  printf '%s\n' 'Netid State Recv-Q Send-Q Local Peer Process'
  printf '%s\n' 'tcp LISTEN 0 128 127.0.0.1:2222 0.0.0.0:* users:(("docker-proxy",pid=701,fd=4))'
}
get_ports_processes
''', "test", str(SCRIPT)], capture_output=True, text=True, check=True)
        self.assertEqual(result.stdout.strip(), "tcp 127.0.0.1:2222 701")

    def test_cgroup_v1_v2_and_systemd(self):
        for pid, cgroup in enumerate((
            f"5:cpu:/docker/{self.container_id}\n",
            f"0::/docker/{self.container_id}\n",
            f"0::/system.slice/docker-{self.container_id}.scope\n",
        ), 400):
            self.process(pid, "python3", cgroup=cgroup)
            self.assertEqual(self.lookup(pid), "homeassistant")

    def test_host_network_container_init_pid(self):
        self.assertEqual(self.lookup(100), "homeassistant")

    def test_container_child_by_pid_namespace(self):
        self.process(500, "python3", namespace="pid:[100]")
        self.assertEqual(self.lookup(500), "homeassistant")

    def test_host_pid_namespace_does_not_claim_host_processes(self):
        self.process(600, "sshd")
        self.process(200, "host-pid-container")
        self.assertEqual(self.lookup(600, "0.0.0.0:22"), "-")


if __name__ == "__main__":
    unittest.main()
