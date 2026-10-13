"""Test Linux procfs command lookup without requiring Linux or root."""
from pathlib import Path
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


if __name__ == "__main__":
    unittest.main()
