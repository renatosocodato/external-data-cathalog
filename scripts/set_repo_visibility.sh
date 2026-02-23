#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <public|private>"
  exit 1
fi

VISIBILITY="$1"
if [[ "$VISIBILITY" != "public" && "$VISIBILITY" != "private" ]]; then
  echo "Error: visibility must be public or private"
  exit 1
fi

gh repo edit --visibility "$VISIBILITY"

echo "Repository visibility set to: $VISIBILITY"
