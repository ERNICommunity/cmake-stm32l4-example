# App

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

# Create CMake project
set(PROJECT "cmake-raspberry-pi-example")
project(${PROJECT} VERSION 1.0.0 LANGUAGES C CXX ASM)

# Set Language Standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Set names of needed components
set(TARGET "${PROJECT}_app")
set(LIBRARY_CORE "${PROJECT}_core")

# Add libararies
add_subdirectory("../../core" ${CMAKE_CURRENT_BINARY_DIR}/core)

# Add files for the build process
set(SOURCES
        "main.cpp"
)

# Create and configure target
add_executable(${TARGET}
        ${SOURCES}
)
target_link_libraries(${TARGET}
        ${LIBRARY_CORE}
)
target_include_directories(${TARGET} 
        PUBLIC 
                .
)