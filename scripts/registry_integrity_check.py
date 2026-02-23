#!/usr/bin/env python3
"""Registry and provenance artifact integrity checks used by CI and local make target."""

from __future__ import annotations

import csv
from pathlib import Path


REQUIRED_FILES = [
    'phase8_31_dataset_registry.csv',
    'provenance_handoff_card.tsv',
    'provenance_handoff_card.md',
    'governance_summary.tsv',
    'reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv',
]

MISSING_VALUES = {'', 'n/a', 'na', 'none', 'tbd', 'null', 'not retrieved'}


def _is_missing(value: str) -> bool:
    return (value or '').strip().lower() in MISSING_VALUES


def validate_dataset_registry(path: Path) -> int:
    with path.open(newline='') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    if not rows:
        raise SystemExit('phase8_31_dataset_registry.csv has no data rows')

    required = [
        'phase_range',
        'dataset_name',
        'accession',
        'doi',
        'source_url',
        'local_root',
        'license',
        'restrictions',
        'notes',
        'contact',
    ]

    missing_headers = [h for h in required if h not in (reader.fieldnames or [])]
    if missing_headers:
        raise SystemExit(f"Missing headers in phase8_31_dataset_registry.csv: {missing_headers}")

    issues = []
    for idx, row in enumerate(rows, start=2):
        if _is_missing(row.get('source_url', '')):
            issues.append(f'row {idx}: source_url missing')
        if _is_missing(row.get('license', '')):
            issues.append(f'row {idx}: license missing')
        if _is_missing(row.get('contact', '')):
            issues.append(f'row {idx}: contact missing')

    if issues:
        raise SystemExit('Dataset registry issues: ' + '; '.join(issues[:20]))

    return len(rows)


def validate_handoff_tsv(path: Path) -> int:
    with path.open() as f:
        lines = [ln.strip() for ln in f if ln.strip()]

    if len(lines) < 2:
        raise SystemExit('provenance_handoff_card.tsv must contain at least a header and one row')

    header = lines[0].split('\t')
    if len(header) != 6:
        raise SystemExit(f'provenance_handoff_card.tsv header must have 6 columns, found {len(header)}')

    return max(len(lines) - 1, 0)


def validate_handoff_md(path: Path) -> None:
    text = path.read_text(encoding='utf-8')
    if 'provenance_handoff_card' not in text.lower():
        raise SystemExit('provenance_handoff_card.md does not appear to be a handoff document')


def validate_purge_master(path: Path) -> None:
    with path.open(newline='') as f:
        first = f.readline().strip().split('\t')
    if len(first) < 10 or first[0] != 'run_id':
        raise SystemExit('Unexpected schema in purged_data_provenance_master_third_pass.tsv')


def validate_governance_summary(path: Path) -> None:
    text = path.read_text(encoding='utf-8').strip().splitlines()
    if len(text) < 2:
        raise SystemExit('governance_summary.tsv must include header and one data row')


def main() -> None:
    for rel in REQUIRED_FILES:
        p = Path(rel)
        if not p.exists():
            raise SystemExit(f'Missing required file: {rel}')

    registry_rows = validate_dataset_registry(Path('phase8_31_dataset_registry.csv'))
    handoff_rows = validate_handoff_tsv(Path('provenance_handoff_card.tsv'))
    validate_handoff_md(Path('provenance_handoff_card.md'))
    validate_purge_master(Path('reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv'))
    validate_governance_summary(Path('governance_summary.tsv'))

    print('Registry integrity checks passed.')
    print(f'Registry rows: {registry_rows}')
    print(f'Handoff rows: {handoff_rows}')


if __name__ == '__main__':
    main()
