# App

cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

set(PROJECT "cmake-stm32l4-example")

set(TARGET "${PROJECT}_app")
set(LIBRARY_CORE "${PROJECT}_core")
set(LIBRARY_CMSIS "${PROJECT}_lib-cmsis")
set(LIBRARY_HAL "${PROJECT}_lib-hal")

project(${TARGET} VERSION 1.0.0 LANGUAGES C CXX ASM)

include(../cmake/utilities.cmake)  # Utilities for binary creation

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../external ${CMAKE_CURRENT_BINARY_DIR}/external)
add_subdirectory("../core" ${CMAKE_CURRENT_BINARY_DIR}/core)

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