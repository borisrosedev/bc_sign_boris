B1_DIR := $(CURDIR)/backend_1

guard-venv:
	@[ -d "$(B1_DIR)/.venv" ] || { echo -e "$(ERROR_COLOR)🛑.venv does not exists$(NO_COLOR)\n"; exit 1; }

b.install: guard-venv
	@cd $(B1_DIR)
	source .venv/bin/activate
	result=$$(which python3 | grep -E ".venv")
	if [ -n "result" ]; then
		echo -e "\n$(SUCCESS_COLOR_COLOR)🎉 Path .venv found$(NO_COLOR)\n"
		uv add --dev "fastapi[standard]"
	else
		echo -e "\n$(ERROR_COLOR)🛑 Bad path .venv not found$(NO_COLOR)\n"
	fi

.PHONY: b.install guard-venv
