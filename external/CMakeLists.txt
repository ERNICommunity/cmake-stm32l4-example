# External

set(TARGET ${LIBRARY_STM32CUBEL4})
set(CMSIS_PATH "STM32CubeL4/Drivers/CMSIS")
set(HAL_PATH "STM32CubeL4/Drivers/STM32L4xx_HAL_Driver")
set(FREERTOS_PATH "STM32CubeL4/Middlewares/Third_Party/FreeRTOS/Source")

set(SOURCES
    "${HAL_PATH}/Src/stm32l4xx_hal.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_adc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_adc_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_can.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_comp.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_cortex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_crc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_crc_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_cryp.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_cryp_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dac.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dac_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dcmi.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dfsdm.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dma.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_dma2d.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_firewall.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_flash.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_flash_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_flash_ramfunc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_gpio.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_hash.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_hash_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_hcd.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_i2c.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_i2c_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_irda.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_iwdg.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_lcd.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_lptim.c"
    #"${HAL_PATH}/Src/stm32l4xx_hal_msp_template.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_nand.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_nor.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_opamp.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_opamp_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_pcd.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_pcd_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_pwr.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_pwr_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_qspi.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_rcc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_rcc_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_rng.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_rtc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_rtc_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_sai.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_sd.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_smartcard.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_smartcard_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_smbus.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_spi.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_spi_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_sram.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_swpmi.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_tim.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_tim_ex.c"
    #"${HAL_PATH}/Src/stm32l4xx_hal_timebase_tim_template.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_tsc.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_uart.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_uart_ex.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_usart.c"
    "${HAL_PATH}/Src/stm32l4xx_hal_wwdg.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_adc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_comp.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_crc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_crs.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_dac.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_dma.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_dma2d.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_exti.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_fmc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_gpio.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_i2c.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_lptim.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_lpuart.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_opamp.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_pwr.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_rcc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_rng.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_rtc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_sdmmc.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_spi.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_swpmi.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_tim.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_usart.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_usb.c"
    "${HAL_PATH}/Src/stm32l4xx_ll_utils.c"


    "${FREERTOS_PATH}/CMSIS_RTOS_V2/cmsis_os2.c"

    "${FREERTOS_PATH}/portable/GCC/ARM_CM4F/port.c"

    "${FREERTOS_PATH}/portable/MemMang/heap_4.c"

    "${FREERTOS_PATH}/croutine.c"
    "${FREERTOS_PATH}/event_groups.c"
    "${FREERTOS_PATH}/list.c"
    "${FREERTOS_PATH}/queue.c"
    "${FREERTOS_PATH}/stream_buffer.c"
    "${FREERTOS_PATH}/tasks.c"
    "${FREERTOS_PATH}/timers.c"
)

set(INCLUDE_DIRECTORIES
    "../app/stm32cubel4"

    "${CMSIS_PATH}/Device/ST/STM32L4xx/Include"
    "${CMSIS_PATH}/Include"

    "${HAL_PATH}/Inc"
    "${HAL_PATH}/Inc/Legacy"

    "${FREERTOS_PATH}/CMSIS_RTOS_V2"

    "${FREERTOS_PATH}/portable/GCC/ARM_CM4F"

    "${FREERTOS_PATH}/include"
)

add_library(${TARGET} OBJECT ${SOURCES})

target_compile_definitions(${TARGET}
    PUBLIC
        STM32L475xx
        USE_HAL_DRIVER
)

target_include_directories(${TARGET} PUBLIC ${INCLUDE_DIRECTORIES})

if (NOT CMAKE_CROSSCOMPILING)
    add_subdirectory("googletest")
endif()