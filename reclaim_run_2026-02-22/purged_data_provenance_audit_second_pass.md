# Purged Data Provenance Audit (Second Pass - In-Depth)

Run: `reclaim_run_2026-02-22`
Scope: All purged/archived entries in `reclaim_run_2026-02-22/consolidated_purge_provenance_ledger.tsv` / `purged_data_provenance_registry.csv`.

## Summary
- Total entries audited: 33
- Pass: 33
- Fail: 0
- Public-origin rows: 9
- Local/No-external rows: 24
- Archive destination verification issues: 0

## Origin repository class coverage
- `Amazon S3 (public mirror)`: 2
- `GEO`: 7
- `N/A`: 24

## Public-origin completeness checks
No audit failures detected for completeness or archive consistency.

## Archive destination verification
- Archived items verified present: 3

## Google Drive restore map for archived assets
- `/Users/renatosocodato/amanda sierra_colab/data/devvis/DevVIS_multiome_snRNA_processed.h5ad` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/DevVIS_multiome_snRNA_processed.h5ad`
- `/Users/renatosocodato/amanda sierra_colab/data/atlas/Developing-Mouse-Vis-Cortex-10X-raw.h5ad` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/Developing-Mouse-Vis-Cortex-10X-raw.h5ad`
- `/Users/renatosocodato/RNAseq-redox-cytoskel` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/phase3_pilot_RNAseq-redox-cytoskel`

## Audit ledger (tab-separated)
`/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purged_data_provenance_audit_second_pass.tsv`
