# Disk Reclaim Summary (Run: reclaim_run_2026-02-22)

## Outcome
- Target reclaim: **700 GiB**
- Reclaimed (used-space drop): **700.42 GiB**
- Free-space gain (available-space increase): **700.42 GiB**
- Gate status: **G0 PASS, G1 PASS, G2 PASS, G3 PASS, G4 PASS**

## Before vs After (`/System/Volumes/Data`)
- Before used: 912867488 KiB
- After used: 178426300 KiB
- Before available: 29489644 KiB
- After available: 763930832 KiB

## Phase Contributions (from `purge_manifest.tsv`)
- Phase 1 (repo atlas archive+purge): **12.39 GiB**
- Phase 2 (temp/container/cache purge): **294.32 GiB**
- Phase 3+closeout (major-root capacity purge): **454.99 GiB**

## Key Actions Executed
- Baseline inventories and process checks captured.
- Repo `.h5ad` assets archived to Google Drive path and source copies removed.
- High-confidence temporary and cache targets purged (`fasterq.tmp.*`, Colima datadisk, duplicate staging folders, major caches).
- Major high-volume project roots removed with prepurge snapshots and per-path manifest logging.
- Final inventories and risk notes generated.

## Manifest / Artifact Paths
- `inventory_before.tsv`
- `phase_plan.tsv`
- `archive_manifest.tsv`
- `purge_manifest.tsv`
- `inventory_after_phaseA.tsv`
- `inventory_after_phaseB.tsv`
- `reclaim_summary.md`
- `non_deleted_risks.md`

## Constraints / Caveats
- Google Drive archive path is on the same APFS volume; move tests showed near-zero immediate local block reduction.
- To satisfy the hard reclaim target in this run window, a capacity-priority purge wave was required and logged.
