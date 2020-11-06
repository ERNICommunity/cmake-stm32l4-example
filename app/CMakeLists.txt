# App

set(TARGET ${APP})

set(SOURCES
        "startup/system_stm32l4xx.c"
        "stm32cubel4/stm32l4xx_hal_msp.c"
        "stm32cubel4/stm32l4xx_it.c"
        "stm32cubel4/stm32l4xx_hal_timebase_tim.c"
        "stm32cubel4/freertos.c"
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
        ${LIBRARY_STM32CUBEL4}
        ${LIBRARY_LIB}
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