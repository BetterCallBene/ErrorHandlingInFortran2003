enable_language( Fortran )
#file ( COPY "${CMAKE_SOURCE_DIR}/data"
#    DESTINATION "${CMAKE_BINARY_DIR}/" )

add_executable(example_nversion_algorithm nversion_algorithm_driver.F90 nversion_algorithm.F90)

target_link_libraries(example_nversion_algorithm
		ErrorHandling
)


add_test(
		NAME
		example_nversion_algorithm
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
		COMMAND
		$<TARGET_FILE:example_nversion_algorithm>
)