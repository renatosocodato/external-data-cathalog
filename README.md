# External Data Cathalog

A research-first repository for external-data provenance, governance, and reclaim operations.

## Purpose and operating model

This repo documents and operationalizes a reproducible, auditable data supply chain for biomedical research.
We combine:

- **Health science context:** clear tracking of disease-relevant cohorts, omics inputs, and citation-aware dataset usage.
- **Data-science rigor:** strict provenance capture, manifest/version lineage, and deterministic governance outputs.
- **Developer-grade reproducibility:** environment manifests, minimal packaging scaffolding, and clear operational scripts.

The repository is intended to support transparent review, publication artifacts, and release governance.

## What is in this repo

- `EXTERNAL_DATA_CATALOG.md` — canonical catalog for all external resources.
- `DATA_MANIFEST_SUMMARY.md` — concise storage and status summary.
- `MANIFEST_INDEX.md` — index of all governance/provenance files.
- `DATA_README.md` — navigation layer for fast discovery.
- `phase8_31_dataset_registry.csv` — phase-level external dataset registry.
- `PURGED_DATA_PROVENANCE_CONSOLIDATION.md` — purged dataset provenance consolidation.
- `provenance_handoff_card.tsv` — tab-delimited handoff payload.
- `provenance_handoff_card.md` — shareable markdown version for collaborators/review.
- `governance_summary.tsv` — release-oriented provenance completeness summary.
- `reclaim_run_2026-02-22/` — run-specific ledger and audit artifacts.

## Repository standards

### 1) Reproducibility

- `requirements.txt` and `environment.yml` define dependency baselines.
- Provenance and registry artifacts are immutable records for auditability.
- No analysis outcome is interpreted without linked source paths and references.

### 2) Governance defaults

- Missing licensing/contact information is surfaced and normalized in `phase8_31_dataset_registry.csv`.
- Public-domain completeness, local-only items, and blocked/missing-field risk signals are captured in `governance_summary.tsv`.
- Provenance handoff records support reproducible transfer and archival recovery.

### 3) Health-science communication posture

- Data claims are constrained by source URLs and accession-equivalent identifiers.
- Repository outputs prioritize conservative interpretation and explicit scope boundaries.
- Citation guidance and data-use boundaries are preserved in catalog files.

## Collaboration and review workflow

1. Update source records in `phase8_31_dataset_registry.csv` when new external inputs are added.
2. Regenerate deterministic governance artifacts as needed.
3. Use handoff cards for project handovers and release packets.
4. Keep this repo clean (`git status` should be clear between commits).

## Quick start

```bash
# clone
git clone <repo-url>
cd external\ data_cathalog

# install environment
python -m pip install -r requirements.txt
# or
conda env create -f environment.yml
```

## Branch and commit discipline

- Keep commit messages functional and auditable.
- Include scope and provenance implication in commit notes.
- Prefer small, reviewable commits that map to explicit governance outcomes.

## License and citation policy

See the catalog and manifest files for dataset-level licensing, restrictions, and citation requirements.

