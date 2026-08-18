C_DIR := $(CURDIR)/chore/c
C_SOURCES := $(wildcard $(C_DIR)/*.c)
OBJECTS := $(patsubst %.c,%.o,$(C_SOURCES))
CC := gcc
CFLAGS := -Wall -Wextra
.PHONY: clean run

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

build: $(OBJECTS)
	@cd $(C_DIR) && $(CC) $^ -o $@ $(CFLAGS)

run:
	@cd $(C_DIR) && ./build


clean: ## cleans all .o and exec
	@rm -rf $(OBJECTS) $(C_DIR)/build
