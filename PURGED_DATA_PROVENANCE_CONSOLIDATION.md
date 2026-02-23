# Purged Data Provenance Consolidation

## Scope

This document consolidates purge provenance for run
`reclaim_run_2026-02-22` under `/Users/renatosocodato/external data_cathalog/reclaim_run_2026-02-22/`.
It tracks every removed/archived item, origin/reference evidence, and final Google Drive destination when available.

## Canonical Provenance Ledger

| source_path | source_size_gib | purge_status | archive_status | source_type | accession_or_equivalent | origin_platform | origin_reference_url | google_drive_destination | notes |
|---|---:|---|---|---|---|---|---|---|---|
| `/Users/renatosocodato/PFn1 5xFAD/fasterq.tmp.Renatos-MacBook-Pro-2.local.95902` | 21.158 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/PFn1 5xFAD/fasterq.tmp.Renatos-MacBook-Pro-2.local.99857` | 37.273 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/PFn1 5xFAD/spatial_integration/phase17/fasterq.tmp.Renatos-MacBook-Pro-2.local.8906` | 37.273 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/PFn1 5xFAD/spatial_integration/phase17/fasterq.tmp.Renatos-MacBook-Pro-2.local.9163` | 26.405 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/PFn1 5xFAD/spatial_integration/phase17/fasterq.tmp.Renatos-MacBook-Pro-2.local.9229` | 43.535 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/PFn1 5xFAD/spatial_integration/phase17/fasterq.tmp.Renatos-MacBook-Pro-2.local.9292` | 36.650 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Temporary fasterq chunk removed under phase2/phase3 purge rules. |
| `/Users/renatosocodato/.colima/_lima/_disks/colima/datadisk` | 48.099 | deleted | not_archived | system_cache_or_tooling | local runtime artifact | Local system cache | N/A | N/A | Purged as runtime tooling cache in phase2. |
| `/Users/renatosocodato/Downloads/~` | 33.079 | deleted | not_archived | local_path | local staging/temp artifact | Local filesystem | N/A | N/A | Duplicate staging/temp directory removed. |
| `/Users/renatosocodato/Library/Caches/Homebrew` | 3.777 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/pip` | 1.841 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/com.openai.atlas` | 1.814 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/org.R-project.R` | 1.798 | delete_blocked_permission | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Partial permission-blocked removal; logged in `non_deleted_risks.md`. |
| `/Users/renatosocodato/Library/Caches/colima` | 1.451 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/Google` | 0.918 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/com.anthropic.claudefordesktop.ShipIt` | 0.551 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/Caches/ms-playwright` | 0.499 | deleted | not_archived | system_cache_or_tooling | local cache artifact | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/amanda sierra_colab/data/devvis/DevVIS_multiome_snRNA_processed.h5ad` | 5.554 | deleted | archived_to_google_drive | local_processed_asset | Allen multiome input (DevVIS_multiome_snRNA_processed.h5ad) | Allen Developmental Mouse Atlas S3 | https://allen-developmental-mouse-atlas.s3.amazonaws.com/Multiome/DevVIS_multiome_snRNA_processed.h5ad | `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/DevVIS_multiome_snRNA_processed.h5ad` | Archived via verified copy+size match before source deletion. |
| `/Users/renatosocodato/amanda sierra_colab/data/atlas/Developing-Mouse-Vis-Cortex-10X-raw.h5ad` | 6.833 | deleted | archived_to_google_drive | local_processed_asset | Allen developing mouse Vis cortex raw matrix | Allen Brain Cell Atlas S3 | https://allen-brain-cell-atlas.s3.amazonaws.com/expression_matrices/Developing-Mouse-Vis-Cortex-10X/20260131/Developing-Mouse-Vis-Cortex-10X-raw.h5ad | `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/Developing-Mouse-Vis-Cortex-10X-raw.h5ad` | Archived via verified copy+size match before source deletion. |
| `/Users/renatosocodato/RNAseq-redox-cytoskel` | 10.734 | archived | archived_to_google_drive | local_project_archive | RNAseq-redox-cytoskel (project bundle) | local project archive | N/A | `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/phase3_pilot_RNAseq-redox-cytoskel` | Move-based archive (directory moved to Drive; no single external accession for full bundle). |
| `/Users/renatosocodato/PFn1 5xFAD` | 170.073 | deleted | not_archived | local_project | GSE209583, GSE233208 | NCBI GEO-linked workflow inputs | https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE233208 ; https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE209583 | N/A | Purged in capacity-priority phase; primary external references are GSE233208 and GSE209583 for phase-7 source streams. |
| `/Users/renatosocodato/cdc42_2p_fvsm_velocities` | 63.597 | deleted | not_archived | local_project | local project bundle (cdc42_2p_fvsm_velocities) | Local project workspace | N/A | N/A | Full project root removed in capacity-priority phase. |
| `/Users/renatosocodato/thermocausality_mtce` | 38.263 | deleted | not_archived | local_project | local project bundle (thermocausality_mtce) | Local project workspace | N/A | N/A | Full project root removed in capacity-priority phase. |
| `/Users/renatosocodato/Desktop/CDC42_microglia_paper` | 35.127 | deleted | not_archived | local_project | local_project_bundle (CDC42_microglia_paper) | Local project workspace | N/A | N/A | Full project folder removed in closeout phase. |
| `/Users/renatosocodato/cyto_kb` | 28.864 | deleted | not_archived | local_project | local_project_bundle (cyto_kb) | Local project workspace | N/A | N/A | Full project root removed in capacity-priority phase. |
| `/Users/renatosocodato/redox-secretome-axis` | 24.380 | deleted | not_archived | local_project | local_project_bundle (redox-secretome-axis) | Local project workspace | N/A | N/A | Full project root removed in capacity-priority phase. |
| `/Users/renatosocodato/Downloads/ActinMicrotub` | 61.353 | deleted | not_archived | local_project | local_dataset_bundle (ActinMicrotub) | Local workspace dataset cache | N/A | N/A | Full dataset folder removed in capacity-priority phase. |
| `/Users/renatosocodato/codex_session_logs` | 6.757 | deleted | not_archived | system_cache_or_tooling | local tool-usage logs | Local CLI cache | N/A | N/A | Tooling logs removed at phase3 cleanup. |
| `/Users/renatosocodato/Library/Application Support/Claude` | 18.341 | deleted | not_archived | system_cache_or_tooling | local application cache | Local system cache | N/A | N/A | Application cache removed in phase3_wave2. |
| `/Users/renatosocodato/Downloads` | 11.321 | delete_blocked_permission | not_archived | system_cache_or_tooling | local filesystem root artifact | N/A | N/A | N/A | Permission-blocked top-level directory; retained and recorded in non_deleted_risks.md. |
| `/Users/renatosocodato/.npm` | 2.020 | deleted | not_archived | system_cache_or_tooling | local tool cache | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/.colima` | 1.622 | deleted | not_archived | system_cache_or_tooling | local tool cache | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/Library/R` | 4.133 | deleted | not_archived | system_cache_or_tooling | local tool cache | Local system cache | N/A | N/A | Tooling cache purge. |
| `/Users/renatosocodato/.cmdstan` | 0.457 | deleted | not_archived | system_cache_or_tooling | local tool cache | Local system cache | N/A | N/A | Tooling cache purge. |

## Google Drive restore locations (archived items only)

1. `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/DevVIS_multiome_snRNA_processed.h5ad`
2. `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/repo_phase1_h5ad/Developing-Mouse-Vis-Cortex-10X-raw.h5ad`
3. `/Users/renatosocodato/Library/CloudStorage/GoogleDrive-renato.socodato@gmail.com/My Drive/_disk_reclaim_archive_2026-02-22/phase3_pilot_RNAseq-redox-cytoskel`

## Platform-specific origin classes represented in this purge

- **Public repositories with accession/equivalent identifiers:**
  - NCBI GEO: `GSE233208`, `GSE209583`
  - Allen S3 hosted matrices: DevVIS multiome and Developing-Mouse-Vis-Cortex-10X raw expression matrix
- **No public accession/equivalent found in manifest:**
  - `cdc42_2p_fvsm_velocities`, `thermocausality_mtce`, `Desktop/CDC42_microglia_paper`, `cyto_kb`, `redox-secretome-axis`, `ActinMicrotub`, and all runtime cache deletions.
- **GitHub/Zenodo/Dryad/Figshare origin evidence in this run:**
  - Not directly applicable to the purged set.

## Cross-check references

- Consolidation source: `reclaim_run_2026-02-22/consolidated_purge_provenance_*.tsv`
- Archive manifest: `reclaim_run_2026-02-22/archive_manifest.tsv`
- Purge manifest: `reclaim_run_2026-02-22/purge_manifest.tsv`
- Risk notes: `reclaim_run_2026-02-22/non_deleted_risks.md`
- Run summary: `reclaim_run_2026-02-22/reclaim_summary.md`
- Machine-readable registry: `reclaim_run_2026-02-22/purged_data_provenance_registry.csv`

## Public-repository class note (origin type summary)

- `GEO`: Entries with explicit GEO accession linkage are available for `GSE233208` and `GSE209583`.
- `Amazon S3 mirror`: Entries explicitly linked to Allen atlas S3 URLs for `DevVIS_multiome_snRNA_processed.h5ad` and `Developing-Mouse-Vis-Cortex-10X-raw.h5ad`.
- `GitHub/Zenodo/Dryad/Figshare`: Not represented in the current purged set from run `reclaim_run_2026-02-22`.
- `Local project/cache`: Remaining entries are local workspace-only or system/runtime artifacts with no standalone public accession-equivalent.


## Third-Pass In-Depth Provenance Verification

- `reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.md`: full in-depth third-pass audit with strict checks for accession/reference completeness, manifest consistency, and Google Drive integrity.
- `reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv`: consolidated third-pass evidence master table with manifest provenance joins and inferred-origin validation classes.
- `reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.tsv`: third-pass machine-readable audit ledger.

### Third-pass provenance gate
- Status (run `reclaim_run_2026-02-22`): PASS (33/33 rows).
- Public entries validated against GEO and Amazon S3 mirrors are fully accessioned and URL-backed; local-only rows are explicitly marked and documented as local-only with no external accession equivalent.
- GitHub/Zenodo/Dryad/Figshare explicit accessions are not present in this purged-run set; their absence is tracked in class notes as “not represented in this purged set”.

