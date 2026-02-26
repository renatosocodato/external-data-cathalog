#!/usr/bin/env python3
"""Generate compact recovery manifests for each recovery run directory."""

from __future__ import annotations

from argparse import ArgumentParser
from collections import Counter
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable, List, Sequence


RUN_DIRS = (
    Path("aggressive_recovery_run_2026-02-24"),
    Path("dependency_recovery_run_2026-02-24"),
    Path("reclaim_run_2026-02-22"),
)


KEY_EXTENSIONS = {
    ".csv",
    ".tsv",
    ".md",
    ".yml",
    ".yaml",
    ".json",
    ".txt",
    ".py",
    ".r",
    ".R",
    ".Rmd",
    ".ipynb",
    ".sh",
    ".toml",
    ".log",
}

PRUNABLE_EXTENSIONS = {".log", ".tmp", ".cache"}


@dataclass(frozen=True)
class FileRecord:
    path: Path
    size: int
    sync_class: str


def _human_size(bytes_: int) -> str:
    units = ["B", "KB", "MB", "GB"]
    size = float(bytes_)
    for unit in units:
        if size < 1024.0 or unit == units[-1]:
            if unit == "B":
                return f"{int(size)} {unit}"
            return f"{size:.1f} {unit}"
        size /= 1024.0


def _iter_files(run_dir: Path) -> Iterable[Path]:
    for path in sorted(run_dir.rglob("*")):
        if path.is_file():
            yield path


def _categorize(path: Path) -> str:
    if path.suffix.lower() in PRUNABLE_EXTENSIONS:
        return "prune_candidate"
    if path.suffix.lower() in KEY_EXTENSIONS or path.name.lower() in {
        "README.md",
        "LICENSE",
        "MANIFEST",
        "requirements.txt",
    }:
        return "sync_key"
    return "sync_optional"


def _summary_table(counter: Counter) -> List[str]:
    return [f"| {ext or '(no ext)'} | {count} |" for ext, count in sorted(counter.items())]


def _build_records(run_dir: Path) -> List[FileRecord]:
    records: List[FileRecord] = []
    for path in _iter_files(run_dir):
        sync_class = _categorize(path)
        records.append(FileRecord(path=path.relative_to(run_dir), size=path.stat().st_size, sync_class=sync_class))
    return records


def _write_run_index(run_dir: Path, records: Sequence[FileRecord]) -> None:
    file_count = len(records)
    total_bytes = sum(record.size for record in records)
    ext_counter = Counter(record.path.suffix.lower() for record in records)
    key_records = [r for r in records if r.sync_class == "sync_key"]
    optional_records = [r for r in records if r.sync_class == "sync_optional"]
    prune_records = [r for r in records if r.sync_class == "prune_candidate"]
    largest = sorted(records, key=lambda record: record.size, reverse=True)[:5]

    index_path = run_dir / "recovery_index.md"
    with index_path.open("w", encoding="utf-8") as out:
        out.write(f"# Recovery Index: {run_dir}\n")
        out.write("Scope: compact manifest for deterministic recovery sync and pruning\n")
        out.write(f"Generated UTC: {datetime.now(timezone.utc).isoformat()}\n")
        out.write(f"Run directory: {run_dir.resolve()}\n")
        out.write("\n")
        out.write(f"Total files: {file_count}\n")
        out.write(f"Total size: {_human_size(total_bytes)}\n")
        out.write(f"Key artifacts: {len(key_records)}\n")
        out.write(f"Optional artifacts: {len(optional_records)}\n")
        out.write(f"Prune-candidate artifacts: {len(prune_records)}\n")
        out.write("\n")
        out.write("## Extension mix\n")
        out.write("| extension | file_count |\n|---|---:|\n")
        out.write("\n".join(_summary_table(ext_counter)))
        out.write("\n")
        out.write("\n## Key artifacts (sync_required)\n")
        out.write("| path | size |\n|---|---:|\n")
        if key_records:
            for row in sorted(key_records, key=lambda r: str(r.path)):
                out.write(f"| {row.path.as_posix()} | {_human_size(row.size)} |\n")
        else:
            out.write("| (none) | 0 |\n")
        out.write("\n## Largest files\n")
        out.write("| path | size |\n|---|---:|\n")
        for row in largest:
            out.write(f"| {row.path.as_posix()} | {_human_size(row.size)} |\n")
        out.write("\n## Sync guidance\n")
        out.write("- Keep for deterministic recovery: all `sync_key` artifacts.\n")
        out.write("- Keep optional: `sync_optional` if you need full provenance audit context.\n")
        out.write("- Re-evaluate `prune_candidate` before deletion; keep until governance checks pass.\n")


def _write_manifest(manifest_path: Path, run_records: dict[str, list[FileRecord]]) -> None:
    rows = [["artifact_path", "run_dir", "size_bytes", "category", "sync_class"]]
    for run_dir_name, records in run_records.items():
        for record in records:
            if record.sync_class == "sync_key":
                rows.append(
                    [
                        f"{run_dir_name}/{record.path.as_posix()}",
                        run_dir_name,
                        str(record.size),
                        "recovery_sync",
                        record.sync_class,
                    ]
                )

    with manifest_path.open("w", encoding="utf-8") as out:
        for row in rows:
            out.write("\t".join(row) + "\n")

    print(f"wrote manifest: {manifest_path} (rows: {len(rows) - 1})")


def parse_args() -> tuple[Sequence[Path], Path | None]:
    parser = ArgumentParser(description="Create compact recovery manifests.")
    parser.add_argument("run_dirs", nargs="*", default=None, help="Recovery folders to index.")
    parser.add_argument(
        "--manifest",
        default=None,
        help="Optional TSV path listing files to include in deterministic sync package.",
    )
    args = parser.parse_args()

    if args.run_dirs:
        run_dirs = [Path(p) for p in args.run_dirs]
    else:
        run_dirs = list(RUN_DIRS)
    return run_dirs, Path(args.manifest) if args.manifest else None


def main() -> None:
    run_dirs, manifest_path = parse_args()
    run_records: dict[str, list[FileRecord]] = {}

    for run_dir in run_dirs:
        run_dir = Path(run_dir)
        if not run_dir.exists() or not run_dir.is_dir():
            raise SystemExit(f"Missing recovery run directory: {run_dir}")

        records = _build_records(run_dir)
        run_records[run_dir.as_posix()] = records
        _write_run_index(run_dir, records)
        print(f"wrote recovery index: {run_dir / 'recovery_index.md'}")

    if manifest_path:
        _write_manifest(manifest_path, run_records)


if __name__ == "__main__":
    main()
