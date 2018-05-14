enable_language( Fortran )
#file ( COPY "${CMAKE_SOURCE_DIR}/data"
#    DESTINATION "${CMAKE_BINARY_DIR}/" )

add_executable(example_fragile_input fragile_input_driver.F90 fragile_input.F90)

target_link_libraries(example_fragile_input
		ErrorHandling
)

add_test(
		NAME
		example_fragile_input
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
		COMMAND
		$<TARGET_FILE:example_fragile_input>
)