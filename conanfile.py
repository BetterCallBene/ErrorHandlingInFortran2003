from conans import ConanFile, CMake, tools
import os

class ErrorhandlingConan(ConanFile):
	name = "ErrorHandling"
	version = "0.0.1"
	license = "GNU General Public License v3.0"
	url = "https://github.com/BetterCallBene/ErrorHandlingInFortran2003"
	description = "Error Handling in Fortran 2003"
	settings = "os", "compiler", "build_type", "arch"
	generators = "cmake"

	scm = {
         "type": "git",
         "url": "auto",
         "revision": "auto"
    }

	def build(self):
		cmake = CMake(self)
		cmake.configure()
		cmake.build()
		cmake.install()
		cmake.test()

		# Explicit way:
		# self.run('cmake %s/hello %s'
		#          % (self.source_folder, cmake.command_line))
		# self.run("cmake --build . %s" % cmake.build_config)

	def package(self):
		pass

	def package_info(self):
		self.env_info.ErrorHandling_DIR = os.path.join(self.package_folder, 'setup')

