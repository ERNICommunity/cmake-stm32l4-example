# Source

set(TARGET ${LIBRARY_CORE})
set(INCLUDE_DIRECTORIES ".")
set(SOURCES 
	"calculator.cpp"
)


add_library(${TARGET} OBJECT ${SOURCES})

target_link_libraries(${TARGET} m)

target_include_directories(${TARGET} PUBLIC ${INCLUDE_DIRECTORIES})