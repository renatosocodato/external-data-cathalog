# external data_cathalog

This repository is initialized as a lightweight catalog and provenance tracking area for external data and purge/reclaim records.

## Contents

- `DATA_README.md` — quick links and index for documentation assets
- `DATA_MANIFEST_SUMMARY.md` — summary of data locations and status
- `EXTERNAL_DATA_CATALOG.md` — full catalog and re-download guidance
- `MANIFEST_INDEX.md` — index of files and provenance records
- `PURGED_DATA_PROVENANCE_CONSOLIDATION.md` — purge provenance summary and provenance table
- `phase8_31_dataset_registry.csv` — external dataset registry (phases 8–31)
- `reclaim_run_2026-02-22/` — purge/provenance files from the reclaim run

## Quick governance scaffolding

This directory now includes baseline repository metadata:

- `.gitignore` for common Python/R and editor detritus
- `requirements.txt` for Python dependencies
- `environment.yml` for reproducible conda environments (Python + R)

## Getting started

```bash
git init
python -m pip install -r requirements.txt
conda env create -f environment.yml  # optional
```
