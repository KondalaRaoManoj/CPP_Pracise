# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g -fPIC $(shell pkg-config --cflags Qt5Core Qt5Gui Qt5Widgets)
LDFLAGS = $(shell pkg-config --libs Qt5Core Qt5Gui Qt5Widgets)

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Advanced Recursive Header Search
HEADER_DIRS = $(shell find . -type f -name "*.h" -exec dirname {} \; | sort -u)
INC_FLAGS = $(foreach dir, $(HEADER_DIRS), -I$(dir))

# Files
#SRCS = $(wildcard $(SRC_DIR)/**/*.cpp) $(wildcard $(SRC_DIR)/*.cpp)
SRCS = $(shell find $(SRC_DIR) -name '*.cpp')
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))
TARGET = $(BIN_DIR)/CPP_PRACISE.elf

# Rules
all: $(TARGET)

$(TARGET): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)  # Create the necessary directories
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean
