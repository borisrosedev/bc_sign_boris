CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra
CPP_DIR := $(CURDIR)/chore/cpp
CPP_SOURCES := $(wildcard $(CPP_DIR)/*.cpp)
CPP_OBJECTS := $(patsubst %.cpp,%.o,$(CPP_SOURCES))
CPP_BIN := $(CPP_DIR)/build
.PHONY: build-cpp run-cpp clean-cpp compile-db-cpp

%.o: %.cpp
	@$(CXX) $(CXXFLAGS) -c $< -o $@

$(CPP_BIN): $(CPP_OBJECTS)
	@$(CXX) $(CXXFLAGS) $^ -o $@

build-cpp: $(CPP_BIN) ## compiles the c++ sources

run-cpp: $(CPP_BIN) ## runs the c++ exec
	@$(CPP_BIN)

compile-db-cpp: ## generates compile_commands.json for clangd (needs bear)
	@if ! command -v bear > /dev/null; then
		$(call log, bear is not installed - run: brew install bear, error)
		exit 1
	fi
	$(MAKE) clean-cpp
	bear --output $(CPP_DIR)/compile_commands.json -- $(MAKE) build-cpp
	$(call log, compile_commands.json generated in $(CPP_DIR), success)

clean-cpp: ## cleans all c++ .o and exec
	@rm -rf $(CPP_OBJECTS) $(CPP_BIN)
