# =====================CONSTANTES=============================
CPP_DIR := $(CURDIR)/chore/cpp
CXX := g++
CXXFLAGS := -std=c++17 -Wall
CXX_BIN := $(CPP_DIR)/build
CPP_SOURCES := $(wildcard $(CPP_DIR)/*.cpp)
CPP_OBJECTS := $(patsubst %.cpp,%.o,$(CPP_SOURCES))
# ====================================================

%.o: %.cpp
	@cd $(CPP_DIR) && $(CXX) $(CXXFLAGS) -c $< -o $@

$(CXX_BIN): $(CPP_OBJECTS)
	@$(CXX) $(CXXFLAGS) $^ -o $@

build-cpp: $(CXX_BIN)
run-cpp: ## runs the cc
	@cd $(CPP_DIR) && ./build
clean-cpp:
	@cd $(CPP_DIR) && rm -rf *.o build


.PHONY: build-cpp run-cpp clean-cpp
