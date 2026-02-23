# Contributing

Thank you for contributing to this research-data governance repository.

## Scope of this repository

This repository tracks external-data catalogs, provenance ledgers, and compliance artifacts for biomedical data-science work. Contributions should preserve auditability and reproducibility.

## Core contribution expectations

- Keep every data entry traceable to a public URL, accession, or explicit local-only rationale.
- Document data-use restrictions and license metadata clearly.
- Preserve deterministic outputs for provenance handoff and summary artifacts.
- Avoid removing historical rows from run logs unless a migration note is recorded.

## Required checks before PRs

Please run:

```bash
make ci
```

This verifies:

- Required registry and handoff artifact files exist.
- Dataset registry headers and metadata completeness.
- Handoff TSV/Markdown integrity.
- Purge provenance master TSV schema sanity.

## Branch and review protocol

- Work on topic branches and open PRs against `main`.
- Use concise commit messages describing provenance/compliance impact.
- Confirm whether PR changes require updates to:
  - `phase8_31_dataset_registry.csv`
  - `provenance_handoff_card.tsv`
  - `provenance_handoff_card.md`
  - `governance_summary.tsv`
  - Relevant files under `reclaim_run_2026-02-22/`

## Data-governance and release checklist

For any dataset-related change, include:

- What changed (dataset, source URL, or provenance record).
- Whether data is public-domain-complete or local-only.
- Whether any fields are blocked/missing and why.
- A short note for the release summary if license/contact status changed.

## Branch protection and visibility

- Main branch is configured for protection and review rules.
- Repository visibility is controlled via:
  - `make visibility-public`
  - `make visibility-private`

## Governance scripts

- `scripts/registry_integrity_check.py`
- `scripts/refresh_governance_artifacts.py`
- `scripts/protect_main_branch.sh`
- `scripts/set_repo_visibility.sh`
