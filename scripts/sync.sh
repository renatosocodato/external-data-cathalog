#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BRANCH="${SYNC_BRANCH:-main}"
SYNC_MODE="${1:-daily}"
SYNC_REMOTES=(
  ${SYNC_REMOTES_LIST:-primary origin}
)
LOG_DIR="${SYNC_LOG_DIR:-$HOME/.local/var/log/external-data-cathalog-git-sync}"
LOG_FILE="$LOG_DIR/sync.log"
ALERT_FILE="$LOG_DIR/last_alert.log"
mkdir -p "$LOG_DIR"

now_utc() {
  date -u '+%F %T UTC'
}

notify() {
  local level="$1"
  local message="$2"
  local safe_message

  safe_message="${message//\"/\\\"}"

  printf '%s [%s] %s\n' "$(now_utc)" "$level" "$message" | tee -a "$LOG_FILE" "$ALERT_FILE"

  if command -v logger >/dev/null 2>&1; then
    logger -t external-data-cathalog-sync "${level}: ${message}" || true
  fi

  if command -v osascript >/dev/null 2>&1; then
    osascript -e "display notification \"${safe_message}\" with title \"External Data Sync\" subtitle \"${level}\"" || true
  fi
}

sync_remote() {
  local remote="$1"
  local remote_ref="refs/remotes/${remote}/${BRANCH}"
  local remote_sha
  local local_sha
  local counts

  if ! git remote get-url "$remote" >/dev/null 2>&1; then
    notify "WARN" "Skipping remote '${remote}': not configured"
    return 0
  fi

  git fetch --prune "$remote" "$BRANCH"

  if ! git rev-parse --verify "$remote_ref" >/dev/null 2>&1; then
    notify "WARN" "Remote '${remote}' has no '${BRANCH}' branch; skipping."
    return 0
  fi

  local_sha="$(git rev-parse "$BRANCH")"
  remote_sha="$(git rev-parse "$remote_ref")"

  if [ "$local_sha" = "$remote_sha" ]; then
    notify "INFO" "${remote}/${BRANCH} synchronized at ${local_sha}"
    return 0
  fi

  if git merge-base --is-ancestor "$BRANCH" "$remote_ref"; then
    if ! git merge-base --is-ancestor "$remote_ref" "$BRANCH"; then
      notify "INFO" "Local '${BRANCH}' is behind '${remote}/${BRANCH}'; applying fast-forward merge."
      if ! git merge --ff-only "$remote_ref"; then
        notify "ALERT" "Non-fast-forward merge failed for '${remote}/${BRANCH}'."
        return 1
      fi
      return 0
    fi
  fi

  if git merge-base --is-ancestor "$remote_ref" "$BRANCH"; then
    if ! git merge-base --is-ancestor "$BRANCH" "$remote_ref"; then
      notify "INFO" "Local '${BRANCH}' is ahead of '${remote}/${BRANCH}'; pushing."
      if ! git push "$remote" "$BRANCH"; then
        notify "ALERT" "Push failed for '${remote}/${BRANCH}'."
        return 1
      fi
      return 0
    fi
  fi

  counts="$(git rev-list --left-right --count "${BRANCH}...${remote_ref}")"
  notify "ALERT" "Non-fast-forward conflict for '${remote}/${BRANCH}'. Topology: ${counts}. Manual resolution required."
  return 1
}

cd "$ROOT_DIR"
git checkout "$BRANCH"

sync_failed=0
for remote in "${SYNC_REMOTES[@]}"; do
  sync_remote "$remote" || sync_failed=1
done

if [ "$SYNC_MODE" = "weekly" ]; then
  for remote in "${SYNC_REMOTES[@]}"; do
    if git remote get-url "$remote" >/dev/null 2>&1; then
      git remote prune "$remote" || true
    fi
  done

  if ! git fsck --full --strict; then
    notify "ALERT" "Weekly integrity check failed: git fsck issues detected."
    sync_failed=1
  fi

  remote_entries=()
  for remote in "${SYNC_REMOTES[@]}"; do
    if git remote get-url "$remote" >/dev/null 2>&1 && git rev-parse --verify "refs/remotes/${remote}/${BRANCH}" >/dev/null 2>&1; then
      remote_entries+=("${remote}:$(git rev-parse "refs/remotes/${remote}/${BRANCH}")")
    fi
  done

  unique_hashes=$(printf '%s\n' "${remote_entries[@]}" | awk -F: '{print $2}' | sort -u | grep -v '^$' | wc -l | tr -d ' ')
  if [ "$unique_hashes" -gt 1 ]; then
    notify "ALERT" "Weekly remote verification mismatch: $(printf '%s\n' "${remote_entries[@]}")"
    sync_failed=1
  fi

  if git status --short | grep -q .; then
    notify "INFO" "Weekly verification note: working tree is not clean."
  fi

  find "$LOG_DIR" -maxdepth 1 -type f \( -name '*.log' -o -name '*.json' \) -mtime +30 -delete || true
fi

if [ "$sync_failed" -ne 0 ]; then
  exit 1
fi
