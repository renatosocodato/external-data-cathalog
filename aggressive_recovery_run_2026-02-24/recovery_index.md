# Recovery Index: aggressive_recovery_run_2026-02-24
Scope: compact manifest for deterministic recovery sync and pruning
Generated UTC: 2026-02-26T11:40:36.835145+00:00
Run directory: /Users/renatosocodato/external data_cathalog/aggressive_recovery_run_2026-02-24

Total files: 37
Total size: 35.3 MB
Key artifacts: 35
Optional artifacts: 0
Prune-candidate artifacts: 2

## Extension mix
| extension | file_count |
|---|---:|
| .log | 2 |
| .md | 7 |
| .tsv | 28 |

## Key artifacts (sync_required)
| path | size |
|---|---:|
| aggressive_recovery_summary.md | 373 B |
| dependency_hydration_actions.tsv | 1.2 KB |
| dependency_hydration_final_status.tsv | 249 B |
| dependency_manifest_sweep_full.tsv | 33.5 MB |
| pass14_manual_hydration_attempts.tsv | 2.2 KB |
| placeholder_candidate_map.tsv | 1.8 KB |
| placeholder_inventory_post_pass10.tsv | 116.0 KB |
| placeholder_inventory_post_pass11.tsv | 116.0 KB |
| placeholder_inventory_post_pass14.tsv | 187.0 KB |
| placeholder_inventory_post_pass9.tsv | 104.9 KB |
| placeholder_replacement_actions.tsv | 180.6 KB |
| placeholder_replacement_actions_pass10.tsv | 84 B |
| placeholder_replacement_actions_pass11.tsv | 18.0 KB |
| placeholder_replacement_actions_pass12.tsv | 1 B |
| placeholder_replacement_actions_pass13.tsv | 1 B |
| placeholder_replacement_actions_pass14.tsv | 8.4 KB |
| placeholder_replacement_actions_pass9.tsv | 99.4 KB |
| placeholder_replacement_unresolved.tsv | 140.7 KB |
| post_pass9_candidate_index.tsv | 128.4 KB |
| recovery_index.md | 3.0 KB |
| recovery_pass14_summary.md | 1.5 KB |
| recovery_plan.tsv | 541 B |
| run0049_global_candidate_hits.tsv | 226 B |
| run0049_upstream_probe.tsv | 4.0 KB |
| strict_content_diff_placeholder_paths_pass7_2026-02-24.tsv | 125.1 KB |
| strict_content_diff_placeholder_paths_pass8_2026-02-24.tsv | 511.3 KB |
| strict_content_diff_placeholder_paths_pass8b_2026-02-24.tsv | 124.5 KB |
| strict_content_diff_placeholder_vs_real_pass14_2026-02-24.md | 1.2 KB |
| strict_content_diff_placeholder_vs_real_pass14_2026-02-24.tsv | 482 B |
| strict_content_diff_placeholder_vs_real_pass7_2026-02-24.md | 760 B |
| strict_content_diff_placeholder_vs_real_pass7_2026-02-24.tsv | 594 B |
| strict_content_diff_placeholder_vs_real_pass8_2026-02-24.md | 610 B |
| strict_content_diff_placeholder_vs_real_pass8_2026-02-24.tsv | 490 B |
| strict_content_diff_placeholder_vs_real_pass8b_2026-02-24.md | 603 B |
| strict_content_diff_placeholder_vs_real_pass8b_2026-02-24.tsv | 482 B |

## Largest files
| path | size |
|---|---:|
| dependency_manifest_sweep_full.tsv | 33.5 MB |
| strict_content_diff_placeholder_paths_pass8_2026-02-24.tsv | 511.3 KB |
| placeholder_inventory_post_pass14.tsv | 187.0 KB |
| placeholder_replacement_actions.tsv | 180.6 KB |
| placeholder_replacement_unresolved.tsv | 140.7 KB |

## Sync guidance
- Keep for deterministic recovery: all `sync_key` artifacts.
- Keep optional: `sync_optional` if you need full provenance audit context.
- Re-evaluate `prune_candidate` before deletion; keep until governance checks pass.
