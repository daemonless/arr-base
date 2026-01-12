# Arr Base

Shared base image for *Arr applications (Radarr, Sonarr, Lidarr, Prowlarr) containing common dependencies.

| | |
|---|---|
| **Registry** | `ghcr.io/daemonless/arr-base` |
| **Source** | [https://github.com/daemonless/arr-base](https://github.com/daemonless/arr-base) |
| **Website** | [https://wiki.servarr.com/](https://wiki.servarr.com/) |

## Deployment

### Podman Compose

```yaml
services:
  arr-base:
    image: ghcr.io/daemonless/arr-base:latest
    container_name: arr-base
    environment:
    volumes:
    ports:
    restart: unless-stopped
```

### Podman CLI

```bash
podman run -d --name arr-base \
  ghcr.io/daemonless/arr-base:latest
```

### Ansible

```yaml
- name: Deploy arr-base
  containers.podman.podman_container:
    name: arr-base
    image: ghcr.io/daemonless/arr-base:latest
    state: started
    restart_policy: always
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|

### Volumes

| Path | Description |
|------|-------------|

### Ports

| Port | Protocol | Description |
|------|----------|-------------|

## Notes

- **User:** `root` (UID/GID set via PUID/PGID)
- **Base:** Built on `ghcr.io/daemonless/base` (FreeBSD)