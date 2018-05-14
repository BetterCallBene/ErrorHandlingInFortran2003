enable_language( Fortran )
#file ( COPY "${CMAKE_SOURCE_DIR}/data"
#    DESTINATION "${CMAKE_BINARY_DIR}/" )

add_executable(example_common_wrappers common_wrappers_driver.F90 common_wrappers.F90)

#target_compile_options(example_username_section PRIVATE -cpp -ffree-line-length-none -fimplicit-none)
#target_compile_definitions(example_username_section PRIVATE FC_NO_FINAL_SUPPORT FC_NO_ALLOCATABLE_DTCOMP FC_FIXED_LENGTH_CHARACTERSTRINGS ERROR_HANDLING  )

target_link_libraries(example_common_wrappers
		ErrorHandling
)


add_test(
		NAME
		example_common_wrappers
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
		COMMAND
		$<TARGET_FILE:example_common_wrappers>
)