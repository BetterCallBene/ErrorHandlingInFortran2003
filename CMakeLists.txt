#
# Project
#
#!!! NOTE: Put name of the library here. Should match the directory name
project(ErrorHandling)
set(PROJECT_PREFIX "Error")
cmake_minimum_required ( VERSION 3.5 FATAL_ERROR )


include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

#
# Setup testing
#
#include (CTest)
#find_package(GTest REQUIRED)
#
# exports
#
add_subdirectory(exports)

#
# libraries
#
add_subdirectory(libraries)


#
# tests
#
# add_subdirectory(tests)

#
# install README.md
#
install(FILES 
	README.md 
DESTINATION
	.
)