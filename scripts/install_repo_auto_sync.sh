#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REPO_SLUG="external-data-cathalog"
PLIST_NAME="com.renatosocodato.${REPO_SLUG}.sync"
PLIST_PATH="${HOME}/Library/LaunchAgents/${PLIST_NAME}.plist"
LOG_DIR="${HOME}/Library/Logs/${REPO_SLUG}"
LOG_FILE="${LOG_DIR}/sync.out.log"
ERROR_FILE="${LOG_DIR}/sync.err.log"
HOUR="${EXT_SYNC_HOUR:-6}"
MINUTE="${EXT_SYNC_MINUTE:-0}"
SYNC_SCRIPT="${ROOT_DIR}/scripts/sync.sh"

mkdir -p "$LOG_DIR"

cat > "$PLIST_PATH" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>${PLIST_NAME}</string>
  <key>ProgramArguments</key>
  <array>
    <string>${SYNC_SCRIPT}</string>
    <string>daily</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key>
    <integer>${HOUR}</integer>
    <key>Minute</key>
    <integer>${MINUTE}</integer>
  </dict>
  <key>WorkingDirectory</key>
  <string>${ROOT_DIR}</string>
  <key>StandardOutPath</key>
  <string>${LOG_FILE}</string>
  <key>StandardErrorPath</key>
  <string>${ERROR_FILE}</string>
  <key>RunAtLoad</key>
  <false/>
</dict>
</plist>
PLIST

chmod +x "$SYNC_SCRIPT"

launchctl bootout "gui/$(id -u)" "$PLIST_PATH" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$PLIST_PATH"

echo "Installed daily sync schedule: ${PLIST_NAME}"
echo "Runs at ${HOUR}:${MINUTE} daily (local time)"
echo "Plist: ${PLIST_PATH}"
echo "Logs: ${LOG_FILE}, ${ERROR_FILE}"
