SHELL := /bin/bash

.PHONY: help ci refresh-governance protect-main visibility-public visibility-private set-topics recovery-index package-recovery-artifacts

PYTHON := python3
RECOVERY_RUN_DIRS := aggressive_recovery_run_2026-02-24 dependency_recovery_run_2026-02-24 reclaim_run_2026-02-22
RECOVERY_INDEX_SCRIPT := scripts/recovery_artifact_index.py
RECOVERY_BUNDLE := artifacts/recovery-artifacts-latest.tar.gz
RECOVERY_MANIFEST := recovery_artifact_manifest.tsv

help:
	@echo "Available targets:"
	@echo "  ci                   - run registry/governance integrity checks"
	@echo "  refresh-governance   - regenerate handoff card + governance summary"
	@echo "  protect-main         - configure strict branch protection on main"
	@echo "  set-topics           - set repository topics for governance and reproducibility"
	@echo "  visibility-public    - switch repository to public"
	@echo "  visibility-private   - switch repository to private"
	@echo "  recovery-index       - generate compact recovery manifests for each recovery run"
	@echo "  package-recovery-artifacts - package deterministic recovery artifacts for remote sync"

ci:
	@$(PYTHON) scripts/registry_integrity_check.py

refresh-governance:
	@$(PYTHON) scripts/refresh_governance_artifacts.py
	@$(PYTHON) scripts/registry_integrity_check.py

protect-main:
	@./scripts/protect_main_branch.sh

visibility-public:
	@./scripts/set_repo_visibility.sh public

visibility-private:
	@./scripts/set_repo_visibility.sh private

set-topics:
	@./scripts/set_repo_topics.sh

recovery-index:
	@$(PYTHON) $(RECOVERY_INDEX_SCRIPT) $(RECOVERY_RUN_DIRS)

package-recovery-artifacts:
	@mkdir -p artifacts
	@$(PYTHON) $(RECOVERY_INDEX_SCRIPT) $(RECOVERY_RUN_DIRS) --manifest $(RECOVERY_MANIFEST)
	@tar --owner=0 --group=0 --numeric-owner -czf $(RECOVERY_BUNDLE) \
		-T <(tail -n +2 "$(RECOVERY_MANIFEST)" | cut -f1)
	@sha256sum $(RECOVERY_BUNDLE) > $(RECOVERY_BUNDLE).sha256
