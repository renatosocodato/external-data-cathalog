# Manifest Index

Scope: Index of files in `/Users/renatosocodato/external data_cathalog`.

## Files
- `EXTERNAL_DATA_CATALOG.md` — Unified external data catalog for WO044–WO047 (provenance, usage, re-download commands, disk reclaim guidance).
- `DATA_MANIFEST_SUMMARY.md` — Quick-access summary of cataloged data locations and restoration notes.
- `DATA_README.md` — Quick index for all data documentation in this repository section.
- `phase8_31_dataset_registry.csv` — External registry for phase 8–31 sources (GEO/SRA, Metabolomics Workbench, MetaboLights, Zenodo, Dryad, GitHub, etc.).
- `reclaim_run_2026-02-22/archive_manifest.tsv` — Archive destination records for moved data.
- `reclaim_run_2026-02-22/purge_manifest.tsv` — Purge action records and source sizes.
- `reclaim_run_2026-02-22/consolidated_purge_provenance_ledger.tsv` — Enriched provenance ledger with repository context.
- `reclaim_run_2026-02-22/consolidated_purge_provenance.tsv` — Raw per-path purge provenance fields.
- `reclaim_run_2026-02-22/purged_data_provenance_registry.csv` — Run-specific machine-readable provenance registry for purged assets (run id, path, accession/equivalent, platform evidence, Google Drive destination, purge/archive outcomes).
- `reclaim_run_2026-02-22/purged_data_provenance_in_depth.tsv` — In-depth provenance normalization table (accession/equivalent + origin + Google Drive restore path).
- `reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv` — Third-pass master consolidation joining registry, ledgers, and manifest records.
- `reclaim_run_2026-02-22/purged_data_provenance_audit_second_pass.tsv` — Second-pass machine-readable audit ledger.
- `PURGED_DATA_PROVENANCE_CONSOLIDATION.md` — Consolidated purge provenance with accession/equivalent, source origin URL, and final Google Drive path.
- `reclaim_run_2026-02-22/purged_data_provenance_audit_second_pass.md` — Second-pass provenance audit with completeness and archive verification results.
- `reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.md` — Third-pass in-depth provenance audit with strict public-origin and URL validation.
- `reclaim_run_2026-02-22/purged_data_provenance_audit_third_pass.tsv` — Third-pass machine-readable audit ledger.
- `reclaim_run_2026-02-22/consolidated_purge_provenance_summary_partial.md` — Legacy partial summary (for historical cross-check; prefer consolidated file above).
- `reclaim_run_2026-02-22/reclaim_summary.md` — Reclaim outcome and phase totals.
- `reclaim_run_2026-02-22/inventory_before.tsv` — Baseline inventory snapshot.
- `reclaim_run_2026-02-22/inventory_after_phaseA.tsv` — Inventory after phase A.
- `reclaim_run_2026-02-22/inventory_after_phaseB.tsv` — Inventory after phase B.
- `reclaim_run_2026-02-22/non_deleted_risks.md` — Residual / blocked items and risk notes.
- `reclaim_run_2026-02-22/phase_plan.tsv` — Planned phase targets and gate status.
- `reclaim_run_2026-02-22/process_checks_before.tsv` / `reclaim_run_2026-02-22/.df_before.txt` / `reclaim_run_2026-02-22/phase1_repo_check.tsv` / `reclaim_run_2026-02-22/phase2_postcheck.tsv` — Checkpoint logs used by run.

## Notes
- This folder mirrors the repo root catalog at `cdc42_2p_fvsm_velocities/EXTERNAL_DATA_CATALOG.md` and now also serves as the canonical location for purge provenance consolidation.
