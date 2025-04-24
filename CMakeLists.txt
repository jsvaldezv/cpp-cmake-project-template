# ======================================== Global Configuration ======================================= #

cmake_minimum_required(VERSION 3.5)

# Read version and plugin name and create variables
file(READ "config.cfg" CONFIG_CONTENT)

# Using regular expressions to extract values without newline characters
string(REGEX MATCH "PROJECT_NAME=([^\n]*)" _ ${CONFIG_CONTENT})
set(PROJECT_NAME ${CMAKE_MATCH_1})

string(REGEX MATCH "PROJECT_VERSION=([^\n]*)" _ ${CONFIG_CONTENT})
set(PROJECT_VERSION ${CMAKE_MATCH_1})

string(REGEX MATCH "CPP_VERSION=([^\n]*)" _ ${CONFIG_CONTENT})
set(CPP_VERSION ${CMAKE_MATCH_1})

# See general configuration values
message(STATUS "Project Name: ${PROJECT_NAME}")
message(STATUS "Project Version: ${PROJECT_VERSION}")
message(STATUS "C++ Version: ${CPP_VERSION}")

# ======================================= Project Configuration ======================================= #

project(${PROJECT_NAME}
        VERSION ${PROJECT_VERSION}
        DESCRIPTION "C++ Project Template"
        LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")

set(CMAKE_CXX_STANDARD ${CPP_VERSION})
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CXX_STANDARD_REQUIRED ON)
set(CMAKE_XCODE_GENERATE_SCHEME OFF)
set(CMAKE_OSX_ARCHITECTURES "x86_64;arm64")
set(CMAKE_OSX_DEPLOYMENT_TARGET "10.15" CACHE STRING "Support macOS down to Catalina" FORCE)
set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Configurations" FORCE)

# Add all source files
file(GLOB_RECURSE SOURCE_FILES Source/*.cpp Source/*.h)

# Add executables
add_executable(${PROJECT_NAME} Source/Main.cpp ${SOURCE_FILES})

# Add files to compile 
target_sources(${PROJECT_NAME} PRIVATE ${SOURCE_FILES})
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "")

# Set source structure folder
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} PREFIX "" FILES ${SOURCE_FILES})

# ============================================= Warnings =============================================== #
if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
   add_compile_options(-fdiagnostics-color=always)
elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
   add_compile_options(-fcolor-diagnostics)
endif()