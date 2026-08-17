C_DIR := $(CURDIR)/chore/c
C_SOURCES := $(wildcard $(C_DIR)/*.c)
OBJECTS := $(patsubst %.c,%.o,$(C_SOURCES))
CC := gcc
CFLAGS := -Wall -Wextra

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

main: $(OBJECTS)
	@cd $(C_DIR) && $(CC) $^ -o $@ $(CFLAGS)

run:
	@cd $(C_DIR) && ./main

.PHONY: clean
clean: ## cleans all .o and exec
	@rm -rf $(OBJECTS) $(C_DIR)/main
