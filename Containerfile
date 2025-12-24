ARG BASE_VERSION=15
FROM ghcr.io/daemonless/base:${BASE_VERSION}

ARG FREEBSD_ARCH=amd64
LABEL org.opencontainers.image.title="arr-base" \
      org.opencontainers.image.description="Common base image for *arr applications on FreeBSD" \
      org.opencontainers.image.source="https://github.com/daemonless/arr-base" \
      org.opencontainers.image.vendor="daemonless" \
      org.opencontainers.image.authors="daemonless" \
      org.freebsd.jail.allow.mlock="required"

# Install common .NET dependencies required by Servarr apps
RUN pkg update && \
    pkg install -y \
        sqlite3 \
        icu \
        libunwind \
        libinotify \
        libiconv \
        krb5 \
        ca_root_nss \
        compat13x-amd64 \
        openssl && \
    pkg clean -ay && \
    rm -rf /var/cache/pkg/* /var/db/pkg/repos/*

# Create SQLite symlink for .NET interop and update linker cache
RUN ln -sf libsqlite3.so /usr/local/lib/libe_sqlite3.so && ldconfig

# Add common init scripts if needed
COPY root/ /
