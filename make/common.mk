.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
MAKEFLAGS += --warn-undefined-variables
# =======================================
ERROR_COLOR := \033[36;1m
SUCCESS_COLOR := \033[32;1m
NO_COLOR := \033[0m
