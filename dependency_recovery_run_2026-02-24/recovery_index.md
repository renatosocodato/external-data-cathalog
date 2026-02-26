# Recovery Index: dependency_recovery_run_2026-02-24
Scope: compact manifest for deterministic recovery sync and pruning
Generated UTC: 2026-02-26T11:40:36.836036+00:00
Run directory: /Users/renatosocodato/external data_cathalog/dependency_recovery_run_2026-02-24

Total files: 23
Total size: 149.3 KB
Key artifacts: 23
Optional artifacts: 0
Prune-candidate artifacts: 0

## Extension mix
| extension | file_count |
|---|---:|
| .md | 4 |
| .tsv | 17 |
| .txt | 1 |
| .yml | 1 |

## Key artifacts (sync_required)
| path | size |
|---|---:|
| README.md | 218 B |
| conda_reconciliation_actions.tsv | 4.0 KB |
| conda_recovery_actions.tsv | 9.0 KB |
| deep_manifest_sweep.tsv | 9.0 KB |
| dependency_inventory.tsv | 4.8 KB |
| dependency_targets.tsv | 1.1 KB |
| final_reconciliation_report.md | 1.3 KB |
| manifest_validation.tsv | 4.4 KB |
| python_dependency_check.tsv | 7.3 KB |
| python_dependency_final_status.tsv | 7.8 KB |
| python_dependency_recheck_after_pass1.tsv | 5.9 KB |
| python_reconciliation_actions.tsv | 40.7 KB |
| python_recovery_actions.tsv | 25.3 KB |
| r_recovery_actions.tsv | 783 B |
| recovery_index.md | 2.0 KB |
| recovery_summary.md | 274 B |
| repos_detected.txt | 1.5 KB |
| root_dependency_recovery_status.tsv | 824 B |
| root_dependency_recovery_status_extended.tsv | 1.5 KB |
| thermocausality_environment_cpu_reconcile.yml | 1.8 KB |
| thermocausality_runtime_verification.tsv | 1.4 KB |
| thermocausality_targeted_pkg_reconcile.tsv | 7.6 KB |
| unprocessed_project_dependency_recovery.tsv | 10.7 KB |

## Largest files
| path | size |
|---|---:|
| python_reconciliation_actions.tsv | 40.7 KB |
| python_recovery_actions.tsv | 25.3 KB |
| unprocessed_project_dependency_recovery.tsv | 10.7 KB |
| conda_recovery_actions.tsv | 9.0 KB |
| deep_manifest_sweep.tsv | 9.0 KB |

## Sync guidance
- Keep for deterministic recovery: all `sync_key` artifacts.
- Keep optional: `sync_optional` if you need full provenance audit context.
- Re-evaluate `prune_candidate` before deletion; keep until governance checks pass.
