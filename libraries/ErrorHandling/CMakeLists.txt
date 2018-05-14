enable_language ( Fortran )

#include ( "../../cmake/pickFortranCompilerFlags.cmake" )

add_library(ErrorHandling
	source/error_handling_error.F90
	source/error_handling_common_errors.F90
	source/error_handling_common_wrapper.F90
	source/error_handling_legacy.F90
	source/design_by_contract.F90
	source/error_handling_unittest.F90
	source/error_handling.F90
	source/error_handling_preprocessing.h
)

add_library(${PROJECT_PREFIX}::ErrorHandling ALIAS ErrorHandling)

target_compile_options(ErrorHandling PUBLIC -cpp -ffree-line-length-none -fimplicit-none)
target_compile_definitions(ErrorHandling PUBLIC FC_NO_FINAL_SUPPORT FC_NO_ALLOCATABLE_DTCOMP FC_FIXED_LENGTH_CHARACTERSTRINGS ERROR_HANDLING )

target_include_directories(ErrorHandling
	PRIVATE
		source
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include>
		$<INSTALL_INTERFACE:include>
)

set_target_properties(ErrorHandling PROPERTIES
	FOLDER libraries
	OUTPUT_NAME ${PROJECT_PREFIX}-ErrorHandling
	Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include
)

install(TARGETS ErrorHandling
	EXPORT Targets
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install ( DIRECTORY "${CMAKE_BINARY_DIR}/include/" DESTINATION  include )