SHELL := /bin/bash

.PHONY: help ci refresh-governance protect-main visibility-public visibility-private set-topics

PYTHON := python3

help:
	@echo "Available targets:"
	@echo "  ci                   - run registry/governance integrity checks"
	@echo "  refresh-governance   - regenerate handoff card + governance summary"
	@echo "  protect-main         - configure strict branch protection on main"
	@echo "  set-topics           - set repository topics for governance and reproducibility"
	@echo "  visibility-public    - switch repository to public"
	@echo "  visibility-private   - switch repository to private"

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
