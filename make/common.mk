.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
.DEFAULT_GOAL := help
# =====================================================
INFO_COLOR := \033[36;1m
ERROR_COLOR := \033[31;1m
SUCCESS_COLOR := \033[32;1m
NO_COLOR := \033[0m

# ====================================================
help: ## shows this help
	@echo -e "\n$(SUCCESS_COLOR) ============= AVAILABLE TARGETS ================= $(NO_COLOR)\n"
		grep -hE "^[a-z_.-]+:.*?## .*$$" $(MAKEFILE_LIST) | sort | awk -F ":.*?##" \
	'{printf "$(INFO_COLOR)%-20s$(NO_COLOR)%s\n", $$1, $$2}'
	echo -e "\n$(SUCCESS_COLOR) ============= END OF TARGETS =================== $(NO_COLOR)\n"
