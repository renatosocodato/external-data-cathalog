#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-renatosocodato}"
REPO="${REPO:-external-data-cathalog}"
BRANCH="${BRANCH:-main}"

REPO_PATH="$OWNER/$REPO"

cat >/tmp/branch-protection-payload.json <<'JSON'
{
  "required_status_checks": {
    "strict": true,
    "contexts": []
  },
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "required_approving_review_count": 1,
    "dismiss_stale_reviews": true,
    "require_code_owner_reviews": false,
    "require_last_push_approval": false,
    "dismissal_restrictions": {
      "users": [],
      "teams": []
    }
  },
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "required_conversation_resolution": true,
  "lock_branch": false,
  "allow_fork_syncing": true
}
JSON

echo "Applying branch protection to $REPO_PATH:$BRANCH"

gh api --method PUT "repos/$REPO_PATH/branches/$BRANCH/protection" --input /tmp/branch-protection-payload.json

echo "Branch protection applied."

echo "To tighten CI gating, add required checks in the script payload (contexts array) if desired."
