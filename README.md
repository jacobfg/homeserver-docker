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
It pauses Ofelia while checking/updating Libation; if a job is running, the update
is deferred and the previously running scheduler is restored. A plain
`docker compose up -d` starts normal services, but does not prepare the scheduled
Libation container on a fresh deployment. Use the updater for the initial start.

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
| `web.yml` | Homer and static web server |

Application configuration lives under `config/traefik`, `config/blocky`,
`config/authelia` and `config/garmin-media-sidecar`. The entire `config/` directory
and root `.env` remain git-crypt protected. Existing application data stays in its
host bind mounts. The audiobook, SFTP, Libation and other modules also live under
`compose/`. Renovate explicitly scans these named module files.

Diagnostic build assets live in `gitops/diagnostics/`, Terraform lives in
`gitops/sftp-server/`, and operational helpers remain in `scripts/`. Run all
Compose commands through the root project, rather than targeting module files.

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
| `scripts/host-open-ipv4-ports.bash` | Inspect host ports exposed to the LAN |

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
