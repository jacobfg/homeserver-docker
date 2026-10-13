"""Exercise container port reporting without root, Docker or namespaces."""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).resolve().parents[1] / 'container-open-ipv4-ports.bash'


class ContainerPorts(unittest.TestCase):
    def report(self, snapshot, tcp='', udp='', fail=False):
        with tempfile.TemporaryDirectory() as proc_root:
            net = Path(proc_root) / '123/net'
            net.mkdir(parents=True)
            if not fail:
                (net / 'tcp').write_text('sl local_address rem_address st\n' + tcp)
                (net / 'udp').write_text('sl local_address rem_address st\n' + udp)
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
report_container_ports "$2"
''', 'test', str(SCRIPT), proc_root],
                env={**os.environ, 'SNAPSHOT': snapshot},
                capture_output=True, text=True)

    def test_internal_ports_multiple_ips_loopback_and_deduplication(self):
        result = self.report('id|/app|123|bridge|frontend=172.18.0.2 backend=172.19.0.2 ',
                             tcp='0: 00000000:1F90 00000000:0000 0A\n',
                             udp='0: 0100007F:14E9 00000000:0000 07\n'
                                 '1: 0100007F:14E9 00000000:0000 07\n')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('0.0.0.0:8080/tcp', result.stdout)
        self.assertEqual(result.stdout.count('127.0.0.1:5353/udp'), 1)
        self.assertIn('frontend=172.18.0.2 backend=172.19.0.2', result.stdout)

    def test_specific_ip_and_connected_sockets(self):
        result = self.report('id|/app|123|bridge|net=192.168.90.2 ',
                             tcp='0: 025AA8C0:01BB 00000000:0000 0A\n'
                                 '1: 025AA8C0:C001 0100007F:0050 01\n',
                             udp='0: 025AA8C0:C002 0100007F:0035 01\n')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('192.168.90.2:443/tcp', result.stdout)
        self.assertNotIn(':49153', result.stdout)
        self.assertNotIn(':49154', result.stdout)

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
