#!/usr/bin/env python3
"""Regenerate governance handoff artifacts from master provenance manifest."""

from __future__ import annotations

from pathlib import Path
from urllib.parse import urlparse

import csv


def extract_domain(url: str) -> str:
    url = (url or '').strip()
    if not url or url.upper() == 'N/A':
        return 'N/A'
    netloc = urlparse(url).netloc
    return netloc or 'N/A'


def main() -> None:
    master = Path('reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv')
    if not master.exists():
        raise SystemExit(f'Missing source file: {master}')

    with master.open(newline='') as f:
        reader = csv.DictReader(f, delimiter='\t')
        rows = list(reader)

    out_tsv = Path('provenance_handoff_card.tsv')
    out_md = Path('provenance_handoff_card.md')
    out_summary = Path('governance_summary.tsv')

    header = [
        'source_path',
        'accession_or_equivalent',
        'origin_repo_domain',
        'origin_reference_url',
        'google_drive_destination',
        'provenance_status',
    ]

    with out_tsv.open('w', newline='') as f:
        writer = csv.DictWriter(f, delimiter='\t', fieldnames=header)
        writer.writeheader()
        for row in rows:
            accession = (row.get('accession_or_equivalent') or '').strip()
            origin_url = (row.get('origin_reference_url') or '').strip()
            destination = (row.get('google_drive_destination') or 'N/A').strip()
            status = f"{(row.get('purge_status') or '')}|{(row.get('archive_status') or '')}".strip('|')
            writer.writerow(
                {
                    'source_path': (row.get('source_path') or '').strip(),
                    'accession_or_equivalent': accession,
                    'origin_repo_domain': extract_domain(origin_url),
                    'origin_reference_url': origin_url or 'N/A',
                    'google_drive_destination': destination,
                    'provenance_status': status,
                }
            )

    total = len(rows)
    public = sum(1 for row in rows if (row.get('public_repository_class') or '').strip().lower() == 'public')
    local_rows = [row.get('source_path', '').strip() for row in rows if (row.get('public_repository_class') or '').strip().lower() == 'local-only']

    with out_md.open('w') as f:
        f.write('# provenance_handoff_card\n')
        f.write('Run ID: reclaim_run_2026-02-22\n')
        f.write('Generated: ') 
        from datetime import datetime
        f.write(datetime.now().isoformat(timespec='seconds'))
        f.write('\n')
        f.write('Rows: %d\n' % (total))
        f.write('Source: reclaim_run_2026-02-22/purged_data_provenance_master_third_pass.tsv\n\n')
        f.write('| source_path | accession_or_equivalent | origin_repo_domain | origin_reference_url | google_drive_destination | provenance_status |\n')
        f.write('|---|---|---|---|---|---|\n')
        for row in rows:
            provenance = f"{(row.get('purge_status') or '')}|{(row.get('archive_status') or '')}".strip('|')
            f.write('| ' + ' | '.join([
                (row.get('source_path') or '').strip(),
                (row.get('accession_or_equivalent') or '').strip(),
                extract_domain((row.get('origin_reference_url') or '').strip()),
                (row.get('origin_reference_url') or 'N/A').strip(),
                (row.get('google_drive_destination') or 'N/A').strip(),
                provenance,
            ]) + ' |\n')

    with out_summary.open('w') as f:
        completeness = (100.0 * public / total) if total else 0.0
        local_summary = '; '.join(local_rows) if local_rows else ''
        f.write('public-domain provenance completeness\tlocal-only rows (explicitly marked)\tblocked/missing fields\n')
        f.write(f'{completeness:.1f}% ({public}/{total})\t{local_summary}\t\n')

    print(f'regenerated {out_tsv}, {out_md}, and {out_summary}')


if __name__ == '__main__':
    main()
