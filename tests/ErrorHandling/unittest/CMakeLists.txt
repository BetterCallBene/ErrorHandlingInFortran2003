enable_language( Fortran )
#file ( COPY "${CMAKE_SOURCE_DIR}/data"
#    DESTINATION "${CMAKE_BINARY_DIR}/" )

add_executable(example_unittests unittest_test_driver.F90 unittest_test.F90)

target_link_libraries(example_unittests
		ErrorHandling
)


add_test(
		NAME
		example_unittests
		WORKING_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
		COMMAND
		$<TARGET_FILE:example_unittests>
)