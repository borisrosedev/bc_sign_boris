CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra
CPP_DIR := $(CURDIR)/chore/cpp
CPP_SOURCES  := $(wildcard $(CPP_DIR)/*.cpp)
CPP_OBJECTS := $(patsubst %.cpp,%.o,$(CPP_SOURCES))
CPP_BIN := $(CPP_DIR)/build

%.o: %.cpp
	@cd $(CPP_DIR) && $(CXX) $(CXXFLAGS) -c $< -o $@

$(CPP_BIN): $(CPP_OBJECTS)
	@$(CXX) $(CXXFLAGS) $^ -o $@

build-cpp: $(CPP_BIN)

run-cpp: $(CPP_BIN)
	@$(CPP_BIN)

clean-cpp:
	@cd $(CPP_DIR) && rm -rf *.o $(CPP_BIN)

.PHONY: clean-cpp build-cpp run-cpp
