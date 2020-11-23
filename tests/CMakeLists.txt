# Tests

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

set(PROJECT "cmake-stm32l4-example")

set(TARGET "${PROJECT}_tests")
set(LIBRARY_CORE "${PROJECT}_core")

project(${TARGET} VERSION 1.0.0 LANGUAGES C CXX)

set(CMAKE_TOOLCHAIN_FILE ../cmake/gcc-linux-toolchain.cmake)

# Set Language Standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Includes
include(CTest)
enable_testing()

# Add libraries
add_subdirectory(googletest)
add_subdirectory("../core" ${CMAKE_CURRENT_BINARY_DIR}/core)

#
set(TEST_SOURCES "main.cpp")
set(TEST_FLAGS "-O0;-g")
#include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})


# Add and configure target
add_executable(${TARGET} ${TEST_SOURCES})
target_link_libraries(${TARGET} PRIVATE 
    ${LIBRARY_CORE} 
    gtest 
    pthread
)
target_compile_options(${TARGET} PUBLIC ${TEST_FLAGS})
target_compile_features(${TARGET} PUBLIC cxx_std_17)

add_test(NAME ${LIBRARY_LIB}.${TARGET} COMMAND ${TARGET})