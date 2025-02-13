# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

# Advanced Recursive Header Search
# Search all directories containing .h files anywhere in the project tree
HEADER_DIRS = $(shell find . -type f -name "*.h" -exec dirname {} \; | sort -u)
INC_FLAGS = $(foreach dir, $(HEADER_DIRS), -I$(dir))

# Files
SRCS = $(wildcard $(SRC_DIR)/**/*.cpp) $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))
TARGET = $(BIN_DIR)/CPP_PRACISE.elf

# Rules
all: $(TARGET)

$(TARGET): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) -c $< -o $@   # Deep recursive include paths added

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)

.PHONY: all clean

