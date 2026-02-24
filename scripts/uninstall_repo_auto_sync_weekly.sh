#!/usr/bin/env bash
set -euo pipefail

PLIST_NAME="com.renatosocodato.external-data-cathalog.sync-weekly"
PLIST_PATH="${HOME}/Library/LaunchAgents/${PLIST_NAME}.plist"

launchctl bootout "gui/$(id -u)" "$PLIST_PATH" 2>/dev/null || true
rm -f "$PLIST_PATH"

echo "Removed scheduled weekly sync-audit: ${PLIST_NAME}"
