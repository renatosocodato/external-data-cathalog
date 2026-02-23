#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-renatosocodato}"
REPO="${REPO:-external-data-cathalog}"
REPO_PATH="$OWNER/$REPO"

TOPICS=("data-governance" "provenance" "health-data" "reproducibility")

if [ "${#TOPICS[@]}" -eq 0 ]; then
  echo "No topics configured"
  exit 1
fi

# Use repo edit with explicit topic flags (works for user/org repos).
gh repo edit "$REPO_PATH" --add-topic "${TOPICS[0]}" --add-topic "${TOPICS[1]}" --add-topic "${TOPICS[2]}" --add-topic "${TOPICS[3]}"

echo "Topics set on $REPO_PATH: ${TOPICS[*]}"
