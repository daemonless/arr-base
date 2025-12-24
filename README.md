# arr-base

Common base image for native FreeBSD OCI containers running *arr applications (Sonarr, Radarr, Lidarr, etc.).

## Overview

This image inherits from `ghcr.io/daemonless/base` and adds the common dependencies required by the .NET runtime on FreeBSD, which all Servarr applications share.

## Features

- **Common Dependencies**: Includes `sqlite3`, `icu`, `libunwind`, `libinotify`, `libiconv`, `krb5`, and `ca_root_nss`.
- **.NET Interop**: Pre-configured `libe_sqlite3.so` symlink for SQLite interop.
- **Multi-OS Support**: Available for FreeBSD 14 and 15.

## Usage

Use this as the base for your *arr application images:

```dockerfile
ARG BASE_VERSION=15
FROM ghcr.io/daemonless/arr-base:${BASE_VERSION}

# Download and install your app...
```

## Tagging

- `ghcr.io/daemonless/arr-base:latest` -> FreeBSD 15
- `ghcr.io/daemonless/arr-base:15` -> FreeBSD 15
- `ghcr.io/daemonless/arr-base:14` -> FreeBSD 14
