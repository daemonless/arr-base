#!/bin/sh
set -e

# Usage: install-arr.sh <app_name> <binary_name> <version> <download_url> <branch>

APP_NAME="$1"
BINARY_NAME="$2"
VERSION="$3"
DOWNLOAD_URL="$4"
BRANCH="$5"

if [ -z "$APP_NAME" ] || [ -z "$BINARY_NAME" ] || [ -z "$VERSION" ] || [ -z "$DOWNLOAD_URL" ] || [ -z "$BRANCH" ]; then
    echo "Usage: $0 <app_name> <binary_name> <version> <download_url> <branch>"
    exit 1
fi

echo "Installing $APP_NAME ($VERSION) from $DOWNLOAD_URL..."

INSTALL_DIR="/usr/local/share/$APP_NAME"
CONFIG_DIR="/config"

mkdir -p "$INSTALL_DIR" "$CONFIG_DIR"

# Download and extract
echo "Fetching and extracting..."
fetch -qo - "$DOWNLOAD_URL" | tar xzf - -C "$INSTALL_DIR" --strip-components=1

# Cleanup
rm -rf "$INSTALL_DIR/$BINARY_NAME.Update"

# Permissions
chmod +x "$INSTALL_DIR/$BINARY_NAME"
chmod -R o+rX "$INSTALL_DIR"

# Package Info
printf "UpdateMethod=docker\nBranch=%s\nPackageVersion=%s\nPackageAuthor=[daemonless](https://github.com/daemonless/daemonless)\n" "$BRANCH" "$VERSION" > "$INSTALL_DIR/package_info"

# App Version
mkdir -p /app
echo "$VERSION" > /app/version

# Ownership
chown -R bsd:bsd "$INSTALL_DIR" "$CONFIG_DIR"

echo "Installation complete."
