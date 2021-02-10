# App

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

# Create CMake project
set(PROJECT "cmake-stm32l4-example")
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
set(LIBRARY_CMSIS "${PROJECT}_lib-cmsis")
set(LIBRARY_HAL "${PROJECT}_lib-hal")

# Includes
include(../../cmake/utilities.cmake)  # Utilities for binary creation

# Disable common networking component, STM has it's own
set(DISABLE_COMMON_NETWORK true)

# Add libararies
add_subdirectory("../../external" ${CMAKE_CURRENT_BINARY_DIR}/external)
add_subdirectory("../../core" ${CMAKE_CURRENT_BINARY_DIR}/core)

# Add files for the build process
set(SOURCES
        "stm32cubel4/system_stm32l4xx.c"
        "stm32cubel4/stm32l4xx_hal_msp.c"
        "stm32cubel4/stm32l4xx_it.c"
        "stm32cubel4/stm32l4xx_hal_timebase_tim.c"
        "main.cpp"
)
set(STARTUP 
        "startup/startup_stm32l475vgtx.s"
)
set(LINKER 
        "${CMAKE_CURRENT_SOURCE_DIR}/startup/STM32L475VGTx_FLASH.ld"
)

# Create and configure target
add_executable(${TARGET}
        ${SOURCES}
        ${STARTUP}
)
target_link_libraries(${TARGET}
        ${LIBRARY_CMSIS}
        ${LIBRARY_HAL}
        ${LIBRARY_CORE}
)
target_link_options(${TARGET}
        PUBLIC 
                -T${LINKER} -Wl,-Map=${TARGET}.map
)
set_target_properties(${TARGET}
        PROPERTIES 
                LINK_DEPENDS ${LINKER}
                SUFFIX ".elf"
)
target_include_directories(${TARGET} 
        PUBLIC 
                .
                ./stm32cubel4
)

create_bin_output(${TARGET})
firmware_size(${TARGET})