# Purged Data Provenance Audit (Third Pass - In-Depth)

Run: `reclaim_run_2026-02-22`
Generated: `2026-02-23 08:48:54Z` UTC

## Summary
- Total rows audited: 33
- Pass: 33
- Fail: 0
- Public-origin rows: 9
- Local/No-external rows: 24
- Archive destination verification issues: 0

## Scope and method
- Source-of-truth rows are the same 33 purged/archived paths represented in `purged_data_provenance_registry.csv`.
- This pass validates:
  - completeness of accession/equivalent fields for external-class rows
  - presence and validity of origin reference URLs
  - cross-consistency across `purge_manifest.tsv`, `archive_manifest.tsv`, and the registry/ledger/depth tables
  - Google Drive destination presence and path integrity for archived entries
  - inferred origin-source domain provenance labels (GEO/S3/GitHub/Zenodo/Dryad/Figshare/local).

## Origin repository class coverage
- `Amazon S3 (public mirror)`: 2
- `GEO`: 7
- `local-only`: 24

## Inferred origin evidence coverage
- `NCBI GEO`: 7
- `S3 public mirror`: 2
- `missing`: 24

## Gate status
PASS: third-pass provenance gate is green (no failing rows).

## Archived item restore map
- `/Users/renatosocodato/RNAseq-redox-cytoskel` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/phase3_pilot_RNAseq-redox-cytoskel`
- `/Users/renatosocodato/amanda sierra_colab/data/atlas/Developing-Mouse-Vis-Cortex-10X-raw.h5ad` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/Developing-Mouse-Vis-Cortex-10X-raw.h5ad`
- `/Users/renatosocodato/amanda sierra_colab/data/devvis/DevVIS_multiome_snRNA_processed.h5ad` -> `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/DevVIS_multiome_snRNA_processed.h5ad`

## Public repository class notes
- This run contains confirmed public entries linked to NCBI GEO and Amazon S3 public mirror URLs.
- No explicit GitHub/Zenodo/Dryad/Figshare rows were present in the purged 33-path evidence set for this run.

## Output files
- Master in-depth consolidation: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv`
- In-depth audit ledger: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.tsv`
- Source registry: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purged_data_provenance_registry.csv`
- Consolidated ledger: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/consolidated_purge_provenance_ledger.tsv`
- In-depth table: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purged_data_provenance_in_depth.tsv`
- Archive manifest: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/archive_manifest.tsv`
- Purge manifest: `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/purge_manifest.tsv`
