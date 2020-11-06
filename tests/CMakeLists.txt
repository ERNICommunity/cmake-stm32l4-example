cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

set(TEST_PROJECT "cmake-stm32l4-example_test")
set(LIBRARY_LIB "${TEST_PROJECT}_lib")
set(TEST_SOURCES "main.cpp")
set(TEST_FLAGS "-O0;-g")

project(${TEST_PROJECT})

include(CTest)
add_subdirectory(googletest)
add_subdirectory("../src" ${CMAKE_CURRENT_BINARY_DIR}/src)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

if (NOT (TARGET gtest AND TARGET gtest_main))
    message(FATAL_ERROR "gtest and gtest_main targets NOT found")
endif()

add_executable(${TEST_PROJECT} ${TEST_SOURCES})
target_link_libraries(${TEST_PROJECT} PRIVATE 
    ${LIBRARY_LIB} 
    gtest 
    pthread
)

target_compile_options(${TEST_PROJECT} PUBLIC ${TEST_FLAGS})
target_compile_features(${TEST_PROJECT} PUBLIC cxx_std_17)

add_test(NAME ${LIBRARY_LIB}.${TEST_PROJECT} COMMAND ${TEST_PROJECT})