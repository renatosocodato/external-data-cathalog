# Project Root Recovery Summary (2026-02-24)

## Scope
Recovery requested for purged project roots with immediate local path continuity and cloud-backed heavy data pointers.

## Recovery Outcomes

| Project root | Status | Recovery mode | Source |
|---|---|---|---|
| `/Users/renatosocodato/Desktop/CDC42_microglia_paper` | present | previously recovered + verified | local restored repo |
| `/Users/renatosocodato/cdc42_2p_fvsm_velocities` | restored | full local restore | local git bundle clone |
| `/Users/renatosocodato/RNAseq-redox-cytoskel` | restored | pointer-linked root | symlink to Drive archive |
| `/Users/renatosocodato/thermocausality_mtce` | restored_partial | snapshot skeleton + Drive phase links | Drive mirror + prepurge snapshot |
| `/Users/renatosocodato/PFn1 5xFAD` | restored_partial | snapshot skeleton + spatial pointer | prepurge snapshot + Drive spatial archive |
| `/Users/renatosocodato/redox-secretome-axis` | restored_partial | snapshot skeleton + session-trace salvage | prepurge snapshot + `.claude` trace corpus |
| `/Users/renatosocodato/cyto_kb` | restored_partial | snapshot skeleton + session-trace salvage | prepurge snapshot + `.claude` trace corpus |
| `/Users/renatosocodato/kb_microglia_nexus` | already_present | verified | existing local root |

## Strict Missing-File Diff + Manuscript Rebuild

- Input literal manuscript targets: `573`
- Recovered from session traces and written: `42`
- Remaining literal manuscript targets missing: `531`
- Report file:
  - `/Users/renatosocodato/Desktop/CDC42_microglia_paper/RECOVERED_FROM_SESSION_TRACES/reconstructed_from_jsonl_report.tsv`
- Updated missing list:
  - `/Users/renatosocodato/Desktop/CDC42_microglia_paper/RECOVERED_FROM_SESSION_TRACES/strict_missing_manuscript_targets_literal_after_rebuild.tsv`

## Provenance files

- Recovery manifest:
  - `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/project_root_recovery_manifest_2026-02-24.tsv`
- Recovery summary:
  - `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/project_root_recovery_summary_2026-02-24.md`

## Storage state

- Current free space (`/System/Volumes/Data`): ~`667 GiB`

