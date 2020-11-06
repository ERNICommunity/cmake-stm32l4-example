# Source

set(TARGET ${LIBRARY_LIB})
set(INCLUDE_DIRECTORIES "../include")
set(SOURCES 
	"calculator.cpp"
)


add_library(${TARGET} OBJECT ${SOURCES})

target_link_libraries(${TARGET} m)

target_include_directories(${TARGET} PUBLIC ${INCLUDE_DIRECTORIES})