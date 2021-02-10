# External


# Add CMSIS 

set(CMSIS_TARGET ${LIBRARY_CMSIS})
set(CMSIS_CORE_PATH "cmsis_core")
set(CMSIS_DEVICE_PATH "cmsis_device_l4")

set(CMSIS_INCLUDE_DIRECTORIES
    "${CMSIS_CORE_PATH}/Include"
    "${CMSIS_DEVICE_PATH}/Include"
)

add_library(${CMSIS_TARGET} INTERFACE)
target_include_directories(${CMSIS_TARGET} INTERFACE ${CMSIS_INCLUDE_DIRECTORIES})


# Add HAL

set(HAL_TARGET ${LIBRARY_HAL})
set(HAL_PATH "stm32l4xx_hal_driver")
set(HAL_INCLUDE_DIRECTORIES
    "../app/B-L475E-IOT01A/stm32cubel4"

    "${HAL_PATH}/Inc"
    "${HAL_PATH}/Inc/Legacy"
)
set(HAL_SOURCES
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
)

add_library(${HAL_TARGET} OBJECT ${HAL_SOURCES})
target_link_libraries(${HAL_TARGET} ${CMSIS_TARGET})

target_compile_definitions(${HAL_TARGET}
    PUBLIC
        STM32L475xx
        USE_HAL_DRIVER
)

target_include_directories(${HAL_TARGET} PUBLIC ${HAL_INCLUDE_DIRECTORIES})