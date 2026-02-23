# Non-Deleted Risks / Archive Limitations

- Google Drive archive path is on the same APFS data volume as source paths.
- Move-to-Drive pilot showed no immediate local block reclaim (`delta_used_k ~= 0`).
- Capacity-priority purge was executed to meet the 700 GiB reclaim requirement.
- Final residual entries (permission-locked or policy-locked):

```tsv
timestamp_utc	path	status	notes
2026-02-22T18:34:09Z	/Users/renatosocodato/Library/Caches/org.R-project.R	delete_blocked_permission	nested cache tree includes permission-restricted files
2026-02-22T18:43:29Z	/Users/renatosocodato/Downloads	delete_blocked_permission	dir exists as protected top-level shell landing path, retention required
```
