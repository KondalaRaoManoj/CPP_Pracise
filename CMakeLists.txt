cmake_minimum_required(VERSION 3.28.3)
project(CPP_PRACISE)


# Use C++17
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


set(CMAKE_INCLUDE_CURRENT_DIR ON)










find_package(Qt6 CONFIG REQUIRED COMPONENTS Core Gui Widgets)


# Define directories

# Set Qt installation path if needed
set(CMAKE_PREFIX_PATH "/lib/x86_64-linux-gnu/qt5")

set(SRC_DIR "${CMAKE_SOURCE_DIR}/src")
set(UI_DIR  "${SRC_DIR}/GUI")
set(UI_GEN_DIR "${CMAKE_BINARY_DIR}/ui_gen")  # Directory for generated UI headers
set(BIN_DIR "${CMAKE_SOURCE_DIR}/bin")

# Ensure output directories exist
file(MAKE_DIRECTORY ${UI_GEN_DIR})
file(MAKE_DIRECTORY ${BIN_DIR})

# Recursively collect all source (.cpp) files
file(GLOB_RECURSE SOURCES "${SRC_DIR}/*.cpp")

# Recursively collect all header files (.h and .hpp)
file(GLOB_RECURSE HEADERS "${SRC_DIR}/*.h" "${SRC_DIR}/*.hpp")
message(STATUS "Headers found: ${HEADERS}")

# Recursively collect all .ui files
file(GLOB_RECURSE UI_FILES "${UI_DIR}/*.ui")
message(STATUS "UI files found: ${UI_FILES}")

# Process .ui files to generate headers using qt5_wrap_ui
#qt6_wrap_ui(UI_HEADERS_GEN ${UI_FILES})
message(STATUS "Generated UI headers: ${UI_HEADERS_GEN}")

# Combine manually written headers with generated UI headers (for IDE dependency tracking)
set(ALL_HEADERS ${HEADERS} ${UI_HEADERS_GEN})

# Extract header directories from the found headers and remove duplicates
set(HEADER_DIRS "")
foreach(header ${HEADERS})
    get_filename_component(header_dir ${header} DIRECTORY)
    list(APPEND HEADER_DIRS ${header_dir})
endforeach()
list(REMOVE_DUPLICATES HEADER_DIRS)
message(STATUS "Header directories: ${HEADER_DIRS}")

# Add include directories: add all header directories, the source directory, and UI generated directory
include_directories(${SRC_DIR} ${UI_GEN_DIR} ${HEADER_DIRS})

# Create the executable target (including headers helps with IDE indexing)
add_executable(${PROJECT_NAME} ${SOURCES} ${ALL_HEADERS})

# Link against Qt libraries
target_link_libraries(${PROJECT_NAME} Qt6::Core Qt6::Gui Qt6::Widgets)

# Set the output directory for the executable
set_target_properties(${PROJECT_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${BIN_DIR}
)

# Optional debug messages (already printed above)
message(STATUS "Sources: ${SOURCES}")