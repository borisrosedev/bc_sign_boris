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
# ==========================================
define log
	@printf '%b%s%b\n' \
		"$(if $(filter success,$(strip $(2))),$(SUCCESS_COLOR),$(if $(filter error,$(strip $(2))),$(ERROR_COLOR),$(INFO_COLOR)))" \
		"$(strip $(1))" "$(NO_COLOR)"
endef

# ====================================================
help: ## shows this help
	@echo -e "\n$(SUCCESS_COLOR) ============= AVAILABLE TARGETS ================= $(NO_COLOR)\n"
		grep -hE "^[a-z_.-]+:.*?## .*$$" $(MAKEFILE_LIST) | sort | awk -F ":.*?##" \
	'{printf "$(INFO_COLOR)%-20s$(NO_COLOR)%s\n", $$1, $$2}'
	echo -e "\n$(SUCCESS_COLOR) ============= END OF TARGETS =================== $(NO_COLOR)\n"
