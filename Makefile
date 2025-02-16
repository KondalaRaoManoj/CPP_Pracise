# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g -fPIC $(shell pkg-config --cflags Qt5Core Qt5Gui Qt5Widgets)
LDFLAGS = $(shell pkg-config --libs Qt5Core Qt5Gui Qt5Widgets)

# Directories
SRC_DIR = src
UI_DIR = src/GUI  # Directory containing .ui files
OBJ_DIR = obj
BIN_DIR = bin

# Advanced Recursive Header Search
HEADER_DIRS = $(shell find . -type f -name "*.h" -exec dirname {} \; | sort -u)
INC_FLAGS = $(foreach dir, $(HEADER_DIRS), -I$(dir))

# UI Compilation
UI_FILES = $(shell find $(UI_DIR) -name '*.ui')
UI_HEADERS = $(patsubst $(UI_DIR)/%.ui, $(UI_DIR)/ui_%.h, $(UI_FILES))

# Source and Object Files
SRCS = $(shell find $(SRC_DIR) -name '*.cpp')
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))
TARGET = $(BIN_DIR)/CPP_PRACISE.elf

# Rules
all: $(UI_HEADERS) $(TARGET)

# Compile the main target
$(TARGET): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

# Compile .cpp to .o with proper include flags
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)  # Create the necessary directories
	$(CXX) $(CXXFLAGS) $(INC_FLAGS) -c $< -o $@

# Convert .ui to .h using uic
$(UI_DIR)/ui_%.h: $(UI_DIR)/%.ui
	uic $< -o $@

clean:
	find $(OBJ_DIR) -type f -name '*.o' -delete
	find $(BIN_DIR) -type f -name '*.elf' -delete
	find $(UI_DIR) -type f -name 'ui_*.h' -delete

.PHONY: all clean