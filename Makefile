.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c
# ===================
C_DIR := $(CURDIR)/chore/c
C_SOURCES := $(wildcard $(C_DIR)/*.c)
OBJECTS := $(patsubst %.c,%.o,$(C_SOURCES))
CC := gcc
CFLAGS := -Wall -Wextra

%.o: %.c
	@cd $(C_DIR) && $(CC) -c $^ -o $@ $(CFLAGS)


build: $(OBJECTS)
	@$(CC) $^ -o $(C_DIR)/$@ $(CFLAGS)

.PHONY: run.c
run.c:
	@cd $(C_DIR) && ./build


.PHONY: clean
clean:
	@cd $(C_DIR) && rm -rf *.o build
