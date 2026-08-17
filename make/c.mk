C_DIR := $(CURDIR)/chore/c
C_SOURCES := $(wildcard $(C_DIR)/*.c) # -> chore/c/*.c
OBJECTS := $(patsubst %.c,%.o,$(C_SOURCES)) # ->.c ->.o
CC := gcc
CFLAGS := -Wall -Wextra

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

main: $(OBJECTS)
	@cd $(C_DIR) && $(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean
clean: ## cleans all .o and exec
	@rm -rf $(OBJECTS) $(C_DIR)/main
