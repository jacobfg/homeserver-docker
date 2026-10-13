"""Exercise container port reporting without root, Docker or namespaces."""
import os
from pathlib import Path
import subprocess
import unittest

SCRIPT = Path(__file__).resolve().parents[1] / 'container-open-ipv4-ports.bash'


class ContainerPorts(unittest.TestCase):
    def report(self, snapshot, sockets='', fail=False):
        return subprocess.run([
            'bash', '-c', '''
source "$1"
docker() {
  if [[ "$1" == ps ]]; then
    [[ -z "$SNAPSHOT" ]] || echo id
  else
    printf '%s\n' "$SNAPSHOT"
  fi
}
nsenter() {
  [[ "$*" == "-t 123 -n -- ss -H -lntu4" ]] || return 2
  [[ "$FAIL" != true ]] || return 1
  printf '%s\n' "$SOCKETS"
}
report_container_ports
''', 'test', str(SCRIPT)],
            env={**os.environ, 'SNAPSHOT': snapshot, 'SOCKETS': sockets,
                 'FAIL': 'true' if fail else 'false'},
            capture_output=True, text=True)

    def test_internal_ports_multiple_ips_loopback_and_deduplication(self):
        result = self.report('id|/app|123|bridge|frontend=172.18.0.2 backend=172.19.0.2 ',
                             'tcp LISTEN 0 128 0.0.0.0:8080 0.0.0.0:*\n'
                             'udp UNCONN 0 0 127.0.0.1:5353 0.0.0.0:*\n'
                             'udp UNCONN 0 0 127.0.0.1:5353 0.0.0.0:*')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('0.0.0.0:8080/tcp', result.stdout)
        self.assertEqual(result.stdout.count('127.0.0.1:5353/udp'), 1)
        self.assertIn('frontend=172.18.0.2 backend=172.19.0.2', result.stdout)

    def test_host_network_is_not_misattributed(self):
        result = self.report('id|/homeassistant|999|host|')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('no separate container IP', result.stdout)
        self.assertIn('see host port script', result.stdout)

    def test_no_listeners_still_shows_ip(self):
        result = self.report('id|/worker|123|bridge|backend=172.19.0.3 ')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('worker', result.stdout)
        self.assertIn('backend=172.19.0.3', result.stdout)

    def test_namespace_failure_is_reported(self):
        result = self.report('id|/app|123|bridge|net=172.18.0.2 ', fail=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Could not inspect app', result.stderr)

    def test_no_containers(self):
        result = self.report('')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(len(result.stdout.splitlines()), 1)


if __name__ == '__main__':
    unittest.main()
