# ARM GCC Cortex Toolchain

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(TARGET_TRIPLET "arm-linux-gnueabihf-")

# default to Release build
if(NOT CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
            "Choose the type of build, options are: Debug Release."
            FORCE)
endif()

find_program(COMPILER_ON_PATH "${TARGET_TRIPLET}gcc")

if(DEFINED ENV{ARM_GCC_PATH}) 
    # use the environment variable first    
    file(TO_CMAKE_PATH $ENV{ARM_GCC_PATH} ARM_TOOLCHAIN_PATH)
    message(STATUS "Using ENV variable ARM_GCC_PATH = ${ARM_TOOLCHAIN_PATH}")
elseif(COMPILER_ON_PATH) 
    # then check on the current path
    get_filename_component(ARM_TOOLCHAIN_PATH ${COMPILER_ON_PATH} DIRECTORY)
    message(STATUS "Using ARM GCC from path = ${ARM_TOOLCHAIN_PATH}")
elseif(VSWHERE_PATH) 
    # try and find if its installed with visual studio
    file(TO_CMAKE_PATH ${VSWHERE_PATH} ARM_TOOLCHAIN_PATH)
    if(ARM_TOOLCHAIN_PATH)
        string(STRIP ${ARM_TOOLCHAIN_PATH} ARM_TOOLCHAIN_PATH)
        message(STATUS "Using Visual Studio install ${ARM_TOOLCHAIN_PATH}")
    endif()
else() 
    # Abort if no gcc was found
    message(FATAL_ERROR "ARM GCC not found!")
endif()

# perform compiler test with the static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_COMPILER    ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}gcc CACHE STRING "")
set(CMAKE_CXX_COMPILER  ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}g++ CACHE STRING "")
set(CMAKE_ASM_COMPILER  ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}gcc)
set(CMAKE_LINKER        ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}gcc)
set(CMAKE_SIZE_UTIL     ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}size)
set(CMAKE_OBJCOPY       ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}objcopy)
set(CMAKE_OBJDUMP       ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}objdump)
set(CMAKE_NM_UTIL       ${ARM_TOOLCHAIN_PATH}/${TARGET_TRIPLET}nm)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

#--specs=nano.specs
set(CMAKE_COMMON_FLAGS "-ffunction-sections -fdata-sections -fno-strict-aliasing -fno-builtin -Wunused -Wuninitialized -Wall -Wshadow -Wdouble-promotion -Werror")
set(CMAKE_C_FLAGS 	"${MCPU_FLAGS} ${VFP_FLAGS} ${CMAKE_COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS} ${CMAKE_COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${LD_FLAGS} -fno-common -Wl,--gc-sections,-print-memory-usage")

set(CMAKE_C_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_CXX_ASM_FLAGS_DEBUG "-O0 -g3")
set(CMAKE_C_ASM_FLAGS_DEBUG "-g3")

set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_CXX_FLAGS_RELEASE "-Os")
set(CMAKE_ASM_FLAGS_RELEASE "")
