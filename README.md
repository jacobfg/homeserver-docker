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
| `music.yml` | Music Assistant |
| `backup.yml` | Duplicacy |
| `portainer.yml` | Portainer and its socket proxy |
| `metrics.yml` | InfluxDB |
| `scheduler.yml` | Container scheduler and restricted socket proxy |
| `web.yml` | Homer and static web server |

For one-time backup storage cleanup, see the
[Duplicacy Web cleanup guide](docs/duplicacy-cleanup.md).

Application configuration lives under `config/traefik`, `config/blocky`,
`config/authelia` and `config/garmin-media-sidecar`. The entire `config/` directory
and root `.env` remain git-crypt protected. Existing application data stays in its
host bind mounts. The audiobook, SFTP, Libation and other modules also live under
`compose/`. Renovate explicitly scans these named module files.

Diagnostic build assets live in `gitops/diagnostics/`, Terraform lives in
`gitops/sftp-server/`, and operational helpers remain in `scripts/`. Run all
Compose commands through the root project, rather than targeting module files.

### Music Assistant

Music Assistant is available at `https://music.$DOMAINNAME_CLOUD_SERVER` through
the existing Traefik TLS and Authelia middleware. Ensure DNS and the Authelia
access policy cover this hostname. Before starting it, create
`$VOLUME_DIR/music-assistant/data` with write access for `$PUID:$PGID`.
The module inherits the non-root user, dropped capabilities, read-only root
filesystem, no-new-privileges and bounded local logs from `base-logged`.
Only `/data` and a bounded `/tmp` tmpfs are writable.

As required by the [upstream installation guide](https://www.music-assistant.io/installation/),
host networking enables LAN speaker discovery and streaming. Direct LAN access
to port 8095 bypasses Authelia; configure Music Assistant's own authentication.
Players also need the stream server (port 8097 by default) and provider-specific
ports. Use `http://music-assistant:8095` for the Home Assistant integration.
Keep these listeners on the trusted LAN rather than forwarding them from the internet.

Home Assistant and Music Assistant both use host networking. Their Compose
`extra_hosts` entries map each other's service names to `127.0.0.1`, so API
traffic stays on loopback. If configuring Home Assistant access in Music
Assistant, use `http://homeassistant:8123`. These URLs bypass Traefik/Authelia;
the destination application's authentication still applies. Keep Music
Assistant's advertised streaming address set to the host's LAN IP so speakers
can reach it. No host interface or route commands are required after reboot.

For local music, uncomment the read-only `/media` bind mount in `compose/music.yml`
and select it in the filesystem provider. Mount network shares on the host;
in-container SMB/NFS mounting is intentionally not granted elevated privileges.
The initial 4 GiB memory ceiling needs checking against real library scans and
concurrent playback. Start and inspect the service from the repository root:

```bash
docker compose config --quiet
docker compose up -d music-assistant
docker compose logs --tail=100 music-assistant
```

To connect [Audiobookshelf as a music provider](https://www.music-assistant.io/music-providers/audiobookshelf/),
add it in Music Assistant under **Settings > Music providers** with server URL
`https://audiobookshelf.$DOMAINNAME_CLOUD_SERVER`. The `extra_hosts` entry in
`music.yml` resolves that hostname to Traefik's `192.168.92.254` address on
`abs_green_internal`, preserving the HTTPS hostname while keeping traffic on
the Docker host. The host reaches this bridge directly, using its bridge-side
source address in `192.168.92.0/24`, which the existing Audiobookshelf bypass
router allows without an Authelia redirect. Audiobookshelf still validates the
API key. This does not require expanding the LAN bypass CIDRs.

Create a dedicated Audiobookshelf API key for the user whose libraries and
listening progress Music Assistant should use, then enter it in the provider's
**Token** field. Use a current API key rather than a legacy user token.
The credential placeholder is `$SECRETS_DIR/music_assistant_audiobookshelf_token`;
store the real key there outside version control. Optional Compose secret
declarations are commented in `music.yml` and can be enabled after creating the
file. They mount it at `/run/secrets/music_assistant_audiobookshelf_token`;
they do not configure the provider automatically or enable a `TOKEN_FILE`
environment variable. Music Assistant saves provider settings in its persistent
`/data` directory; protect that directory and its backups as credentials.

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

#### Personal Homer dashboards

Homer requests `/assets/config.yml`. After Authelia authenticates the request,
the local `homerconfig` Traefik plugin uses `Remote-User` to request
`/assets/config.<username>.yml` from Homer. Only a 404 triggers one retry for
`/assets/config.yml`; other errors propagate. There is no `.yaml` alias.

Keep a default `config.yml` in `$VOLUME_DIR/homer/assets`, and optionally add
complete personal configurations such as `config.alice.yml`. Filenames are
case-sensitive and must match the Authelia username exactly. Supported usernames
contain ASCII letters, digits, `_`, `@`, `.`, or `-`, excluding `.` and `..`.
Personal files replace the default rather than merging with it. All files must
be readable by Homer. Changes to these files need no Traefik restart.

Direct browser requests for `config.<username>.yml` return 404, including requests
for the caller's own file. Config responses disable caching and conditional/range
requests, so switching accounts fetches a fresh config. Other page configs and
assets remain shared. Personalisation does not grant or revoke access to widget
APIs or applications; keep secrets out of dashboard files.

The source in `plugins/homerconfig` is mounted read-only into Traefik and loaded
in local plugin mode. Deploy the repository including this directory, then run
`docker compose up -d --force-recreate traefik homer` to load the plugin and new
Homer router labels. Plugin source changes require recreating Traefik. Verify a
user with a personal file and one without, direct-file rejection, and logout/login
switching in the same browser. Reload the dashboard after switching accounts;
an already-rendered page is not cleared automatically on logout. Clear old site
data once during rollout if an existing browser/service worker retains old config.

Validation:

```sh
(cd plugins/homerconfig && go test -race ./...)
python3 -m unittest discover -s scripts/tests -p 'test_homer*.py'
RUN_HOMER_INTEGRATION=1 python3 -m unittest discover -s scripts/tests -p test_homer_plugin_integration.py
docker compose config --quiet
```

The opt-in integration test needs Go and a running Docker daemon. It uses the
pinned production Traefik image, the real middleware chain, and an isolated mock
authentication/backend service; it does not access live accounts or assets.
For rollback, restore Homer's router to `chain-authelia@file`, remove the
`chain-homer`/`middlewares-homer-config` definitions and Traefik's local-plugin
argument/mount, then recreate Traefik and Homer. Homer will serve the default
again; remove personal files from the assets directory first if they must remain
inaccessible under the original static-file routing.

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

### Static file server security

Static Web Server runs as UID/GID `65532:65532` on port 8080, with all Linux
capabilities dropped, no privilege escalation, and a read-only root filesystem
and content mount. Its dedicated `static_web_internal` network is internal and
shared only with Traefik; no host port is published. This isolates it from the
shared proxy network and external routing, but is not a one-way firewall:
it can still reach Traefik and the host's bridge interface.
Directory listing, hidden-file serving and symlink traversal are disabled.
Runtime error logs are retained with bounded Docker local logging.

Before deploying, ensure `$VOLUME_DIR/static-web-server/public` and its served
subdirectories grant UID/GID `65532:65532` read/traverse access and files grant
read access, using existing permissions or targeted ACLs. Host ownership does
not need to change. Content that relies on symlinks must use regular files.
Only place intended web content in this directory; the source-restricted IoT
routes bypass Authelia for `/iot/` on both HTTPS listeners.

Validate and recreate both services together to apply the network and port change:

```bash
docker compose config --quiet
docker compose up -d traefik static-web-server
```

Verify authenticated static requests and IoT downloads on ports 443 and 8443,
including rejected access from outside the allowed source networks.

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
