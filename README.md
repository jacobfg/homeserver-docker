# homeserver-docker

Home Server Docker Environment

<!-- markdownlint-disable no-inline-html -->

<p align="center">

    <a href="https://renovatebot.com">
    <img alt="Renovate enabled" src="https://img.shields.io/badge/renovate-enabled-brightgreen.svg?style=flat-square">
    </a>
    <a href="https://github.com/renovatebot/github-action/actions">
      <img alt="GitHub workflow status" src="https://img.shields.io/github/actions/workflow/status/jacobfg/homeserver-docker/renovatebot.yml?style=flat-square">
    </a>
</p>

## Running the environment

Requires Docker Compose **2.40.3+** (validated version) and `jq`. Unlock git-crypt before using the
configuration. Run Compose from the repository root; the included files are
service modules, not independently deployed projects. All application settings
come from the root `.env`, grouped by service with shared host/storage values
defined once. Compose automatically supplies these values to included modules.
Relative config paths resolve from `compose/`; exported environment variables
can override the environment defaults. Deployment registry credentials remain
separate in `scripts/.env`, and secret files remain under `secrets/`.

Compose 2.20.0 introduced includes, but failed the included `.env` resolution
checks for this repository. Helpers reject versions older than the validated minimum.

```bash
docker compose config --quiet
./scripts/update-docker-compose-services.bash
docker compose ps
```

The updater authenticates to GHCR using `scripts/.env`, pulls normal services and
Libation, prepares Libation without running it, and starts the normal services.
It pauses the scheduler while checking/updating Libation; if a job is running, the update
is deferred and the previously running scheduler is restored. A plain
`docker compose up -d` starts normal services, but does not prepare the scheduled
Libation container on a fresh deployment. Use the updater for the initial start.

The scheduler starts the existing Libation container every four hours, with the
first run four hours after scheduler startup. Running jobs are skipped and missed
runs are not replayed. Restart the scheduler after changing its job labels.
The `ofelia.*` labels are compatibility configuration for `container-scheduler`.
Logs honour `TZ`. The image provides its own healthcheck through a private Unix
socket; the scheduler's tmpfs mount makes that socket writable with a read-only
root filesystem.

To run Libation early and reset only its four-hour timer:

```bash
docker compose exec -T scheduler /container-scheduler run-now libation
docker compose exec -T scheduler /container-scheduler healthcheck
```

A successful run-now command means the request was queued; check scheduler logs
for the start, skip, or error result. Running jobs are still skipped. Use
`run-now --all` to explicitly trigger every configured job. The image healthcheck
checks scheduler responsiveness, not job success or Docker availability.

Shared networks are owned by the root project. Compose handles network creation;
there are no deploy weights. Existing isolated networks, subnets and routing
addresses are preserved.

### Core service modules

Each module is a named YAML file under `compose/`, with its services and the
config and secret declarations they consume. Networks remain in root `compose.yaml`.

| File under `compose/` | Services |
| --- | --- |
| `ingress.yml` | Traefik, its socket proxy, Blocky DNS |
| `auth.yml` | Authelia |
| `homeassistant.yml` | Home Assistant, Node-RED, Mosquitto, Zigbee2MQTT |
| `backup.yml` | Duplicacy |
| `portainer.yml` | Portainer and its socket proxy |
| `metrics.yml` | InfluxDB |
| `scheduler.yml` | Container scheduler and restricted socket proxy |
| `web.yml` | Homer and static web server |

Application configuration lives under `config/traefik`, `config/blocky`,
`config/authelia` and `config/garmin-media-sidecar`. The entire `config/` directory
and root `.env` remain git-crypt protected. Existing application data stays in its
host bind mounts. The audiobook, SFTP, Libation and other modules also live under
`compose/`. Renovate explicitly scans these named module files.

Diagnostic build assets live in `gitops/diagnostics/`, Terraform lives in
`gitops/sftp-server/`, and operational helpers remain in `scripts/`. Run all
Compose commands through the root project, rather than targeting module files.

### Dashboard and Garmin routes

`config/traefik/rules/garmin.yml` owns only the port 8443 routes on the
TLS 1.2-compatible `garmin-https` listener, including its `garmin-tls` policy.
Port 443 / TLS 1.3 routes remain in their existing Compose labels. Source CIDRs, paths, priorities and backend authentication are preserved.
The listener and port remain static settings in `compose/ingress.yml`. Traefik
receives `ABS_BYPASS1_CIDR` and `ABS_BYPASS3_CIDR` for the file's templates.
The file routes reuse the Docker-discovered backend services via `@docker`,
including the Garmin proxy and sidecar on `abs_green_internal`.

`config/traefik/rules/homer-api.yml` owns Homer's existing `/dashboard-endpoint`
feed and same-origin widget API routes. Set the widget's `endpoint` to the path
below, keeping its `url` pointed at the application's normal hostname.

The routes authenticate with Authelia before stripping the service prefix.
Backend API credentials are still required where applicable. Portainer must be
running for its widget to work. The message URL remains `/dashboard-endpoint`.
Status widgets can probe the backend root through their `/services/<name>`
endpoint; GET and HEAD are supported. Keep `url` as the normal application URL.
For example, a Node-RED Ping tile uses `endpoint: /services/nodered` alongside
its existing `url`. Append any existing custom health path to the new endpoint.

Homer's live configuration resides in `$VOLUME_DIR/homer/assets`, not this
repository. The Homer-specific CORS middleware and references have been removed.
Update the ESPHome, Node-RED, Authelia, Duplicacy and Fittools tile endpoints to
the paths above when deploying these routes, and verify their status checks.
Configure new widgets with same-origin endpoints and add their routes as needed.

Recreate Traefik and the affected services (`audiobookshelf`, `abs_green_proxy`,
`garmin_media_sidecar`, `homeassistant`, `node-red`, `static-web-server`) together
when deploying, so the new config mounts/environment and removed labels take
effect. Verify Garmin catalogue/downloads on both ports and the Home Assistant
and static-file routes on port 8443 from their allowed source networks.

### On-demand Portainer

From any directory, invoke these scripts by their repository path:

```bash
./scripts/portainer.bash start
./scripts/portainer.bash stop
```

The helper selects every service in the `portainer` profile, including its socket
proxy. Both remain off by default and after Docker/host restarts; data and the
existing Portainer URL are preserved. Routine updates do not start or recreate
these services. To refresh their images explicitly from the repository root:

```bash
docker compose --profile portainer pull portainer socket-proxy
./scripts/portainer.bash start
```

Use the helper to stop the group: `docker compose --profile portainer down` would
also stop the normal services. The same applies to the `diagnostics` profile;
see [resource monitoring](gitops/diagnostics/README.md) for targeted cleanup. ESPHome and
Apprise remain under the existing `disabled` profile; Libation uses `scheduled`.
Do not use `--profile '*' up` to deploy, because it would start every optional job.

### Routine updates and helpers

```bash
git pull --ff-only
./scripts/update-docker-compose-services.bash
```

| Helper | Purpose |
| --- | --- |
| `scripts/portainer.bash start\|stop` | Start or stop the Portainer group |
| `scripts/stop-rm-start.bash SERVICE...` | Recreate selected Compose services |
| `scripts/esphome-clean.sh` | Remove ESPHome build caches from the configured host volume |
| `scripts/gitops.bash COMMAND...` | Run Terraform for SFTPGo; see [GitOps instructions](gitops/sftp-server/README.md) |
| `scripts/host-open-ipv4-ports.bash` | Inspect host IPv4 ports, including loopback, and identify containers |
| `scripts/container-open-ipv4-ports.bash` | Show live container IPv4 listening/bound ports and network IPs |

The host script includes loopback bindings such as `127.0.0.1:2222` and checks
all running Docker containers, including containers outside this repository.

Run the port scripts as root on the Docker host. The container script reads `/proc/<pid>/net/tcp` and `/proc/<pid>/net/udp`
using host tools compatible with BusyBox; neither `nsenter` nor tools inside
containers are needed. It shows
actual TCP listeners and UDP bound sockets, including unpublished and loopback
ports, alongside each container's network IPs. A loopback bind remains local to
its namespace; listing a container IP does not mean that socket listens on it.
Containers sharing a network namespace show that namespace's sockets. Host-network
containers have no separate IP and are marked for inspection with the host script.

Run `bash scripts/esphome-clean.sh` while ESPHome is not compiling. It reads the
root `.env` through Compose and uses the ESPHome `/config` bind mount under
`VOLUME_DIR`. Only `.esphome` build, external-components, IDE, packages and PlatformIO
caches are removed; device YAML and secrets are retained. It works from any
working directory when invoked by its repository path.

### Script checks

```bash
python3 -m unittest discover -s scripts/tests -v
```

These tests mock Docker and do not contact the host daemon.

## Other Dependancies

| Name | Repo | Version |
|------|------|---------|
| Upsy Desky | github.com/tjhorner/upsy-desky | v2.0.0 |
| ESPHome | github.com/esphome/esphome | 2023.12.9 |
