# Final Dependency Recovery and Reconciliation Report

## Scope
Machine-root pass across `/Users/renatosocodato` using repo/folder inventory and manifest-based dependency recovery.

## Outcome
- Python dependency specs checked: 80
- Python satisfied after reconciliation: 78 (in local `.venv` contexts)
- Python unresolved in `.venv`: 2 (`sbi`, `dowhy` under `thermocausality_mtce`)
- R `renv` restores: completed for missing roots
- Conda/Mamba envs created/updated: `M2C2`, `external-data-cathalog`, `thermocausality` (CPU-safe reconciliation lane)

## Trust Anchor
For `thermocausality_mtce`, runtime verification shows full module readiness in the `thermocausality` conda env:
- `sbi`: OK
- `dowhy`: OK
- `deepxde`: OK
- `jax`: OK
- `torch`: OK

`.venv` remains partial for `sbi`/`dowhy` due Python 3.14 resolution constraints.

## Key Artifacts
- `dependency_inventory.tsv`
- `python_dependency_final_status.tsv`
- `python_recovery_actions.tsv`
- `python_reconciliation_actions.tsv`
- `r_recovery_actions.tsv`
- `conda_recovery_actions.tsv`
- `conda_reconciliation_actions.tsv`
- `root_dependency_recovery_status.tsv`
- `thermocausality_runtime_verification.tsv`

## Decision
- Canonical runtime for `thermocausality_mtce` should be `mamba env: thermocausality`.
- Local `.venv` remains usable for most packages but not complete for full causal-inference stack.
