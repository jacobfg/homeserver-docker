This stack captures host and container resource usage on demand. It is excluded
from `scripts/update-docker-compose-services.bash` and all services use the
`diagnostics` profile. Neither service automatically restarts after a host reboot.

From this directory on Lightwhale, start a 12-hour capture at 10-second intervals:

```bash
docker compose up -d --build resource-monitor
docker compose logs -f resource-monitor
```

Explicitly targeting the service enables its profile and starts its proxy dependency.
Disconnecting SSH does not stop collection. Each run creates a timestamped directory
under `/home/op/resource-monitor`, containing `containers.csv`, `host.csv` and, on
completion, `summary.txt`. Reports are root-owned and private; use `sudo` to read them.
The CSV files contain resource counters and container identity, not container secrets.

For a short first check, or a different duration:

```bash
MONITOR_DURATION=60 MONITOR_INTERVAL=5 docker compose up -d --build resource-monitor
```

Then run the first command again to switch to the default overnight duration.
`RESOURCE_REPORT_DIR` overrides the host report directory. To summarize while a
capture is still running (substitute the actual timestamped directory):

```bash
sudo bash ../scripts/monitor-container-resources.bash --summarize /home/op/resource-monitor/resource-monitor-TIMESTAMP
```

After collection, remove the diagnostic containers and network:

```bash
docker compose --profile diagnostics down
```

The sampler exits automatically; the proxy remains running until this cleanup.
The bind-mounted reports survive cleanup. Do not remove the local image while a
capture is running. Subsequent runs can reuse it without rebuilding.

CPU peaks are averages between observations; short spikes or jobs entirely between
observations can be missed. Memory cgroup lifetime peaks can predate collection.
The sampler discovers newly running containers every cycle and separates restarts
using the container ID and start timestamp. No shell is needed inside monitored
containers. A graceful stop writes a report; after a forced kill, `--summarize` can
still process the CSV files already written.

The sampler reads host procfs and cgroups through read-only mounts. Its Docker API
proxy only allows GET/HEAD discovery and inspection. This is sensitive host access,
but no host PID namespace, privileged mode, published ports or Docker write methods
are needed. The proxy network is internal and only the sampler can connect.
