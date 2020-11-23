cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

set(PROJECT "cmake-stm32l4-example")
project(${PROJECT} VERSION 1.0.0)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Disable common networking component, STM has it's own
set(DISABLE_COMMON_NETWORK true)

#Add projects
add_subdirectory("app")
#add_subdirectory("tests")
