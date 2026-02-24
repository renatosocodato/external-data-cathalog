#!/usr/bin/env bash
set -euo pipefail

PLIST_NAME="com.renatosocodato.external-data-cathalog.sync"
PLIST_PATH="${HOME}/Library/LaunchAgents/${PLIST_NAME}.plist"
WEEKLY_PLIST_NAME="com.renatosocodato.external-data-cathalog.sync-weekly"
WEEKLY_PLIST_PATH="${HOME}/Library/LaunchAgents/${WEEKLY_PLIST_NAME}.plist"

launchctl bootout "gui/$(id -u)" "$PLIST_PATH" 2>/dev/null || true
rm -f "$PLIST_PATH"

launchctl bootout "gui/$(id -u)" "$WEEKLY_PLIST_PATH" 2>/dev/null || true
rm -f "$WEEKLY_PLIST_PATH"

echo "Removed scheduled sync: ${PLIST_NAME}"
echo "Removed scheduled weekly sync-audit: ${WEEKLY_PLIST_NAME}"
