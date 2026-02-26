# Recovery Record: CDC42_microglia_paper (2026-02-24)

## Trigger
Immediate recovery requested for deleted path:
`/Users/renatosocodato/Desktop/CDC42_microglia_paper`

## Deletion provenance (pre-existing)
- Purge manifest entry exists with `rm -rf` action and `not_archived` status.

## Recovery actions performed
1. Restored from local git bundle:
   - Source bundle: `/Users/renatosocodato/.local/share/git-bundles/cdc42_2p_fvsm_velocities/cdc42_2p_fvsm_velocities_20260218_002816.bundle`
   - Restored to: `/Users/renatosocodato/Desktop/CDC42_microglia_paper`
   - Restored footprint: ~5.7G
2. Recreated compatibility working path:
   - `/Users/renatosocodato/Desktop/CDC42_microglia_paper/phase2/consolidation_phase1+2+3+4`
   - Added symlinks: `manuscript`, `phases`, `outputs`, `results`, `scripts`, `data`
3. Added trace-based salvage package:
   - `/Users/renatosocodato/Desktop/CDC42_microglia_paper/RECOVERED_FROM_SESSION_TRACES`
   - Includes tool-result text captures and path-reference indices from local session logs.

## Snapshot restore status
- Local Time Machine destination not configured.
- `tmutil listlocalsnapshots /` showed no usable local snapshots.
- APFS OS snapshot exists but cannot be mounted with available local tooling on this host.

## Current state
- Project path restored and immediately usable.
- Restored content is bundle-backed; non-git untracked files beyond bundle scope may still be absent.
