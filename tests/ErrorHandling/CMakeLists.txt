enable_language( Fortran )
file ( COPY "${CMAKE_SOURCE_DIR}/data"
    DESTINATION "${CMAKE_BINARY_DIR}/" )

add_executable(example_username_section username_selection_driver.F90 username_selection.F90)

target_compile_definitions(example_username_section PRIVATE ERROR_HANDLING  )

target_link_libraries(example_username_section
		ErrorHandling
)


add_test(
		NAME
		example_username_section
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
		COMMAND
		$<TARGET_FILE:example_username_section>
)