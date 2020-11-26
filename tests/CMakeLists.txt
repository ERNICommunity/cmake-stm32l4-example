# Tests

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

# Create CMake project
set(PROJECT "cmake-stm32l4-example")
project(${PROJECT} VERSION 1.0.0 LANGUAGES C CXX)

# Set Language Standards
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set names of needed components
set(TARGET "${PROJECT}_tests")
set(LIBRARY_CORE "${PROJECT}_core")

set(CMAKE_TOOLCHAIN_FILE ../cmake/gcc-linux-toolchain.cmake)

# Includes
include(CTest)
enable_testing()

# Add libraries
add_subdirectory(googletest)
add_subdirectory("../core" ${CMAKE_CURRENT_BINARY_DIR}/core)

# Sources
set(TEST_SOURCES "main.cpp")
set(TEST_FLAGS "-O0;-g")

# Add and configure target
add_executable(${TARGET} ${TEST_SOURCES})
target_link_libraries(${TARGET} PRIVATE 
    ${LIBRARY_CORE} 
    gtest 
    pthread
)
target_compile_options(${TARGET} PUBLIC ${TEST_FLAGS})

add_test(NAME ${LIBRARY_LIB}.${TARGET} COMMAND ${TARGET})