# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/apps/cmake/2.8.9/bin/cmake

# The command to remove a file.
RM = /opt/apps/cmake/2.8.9/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /opt/apps/cmake/2.8.9/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home1/02556/rbrito/UT_Internship/galois

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home1/02556/rbrito/UT_Internship/galois/build/mic

# Include any dependencies generated for this target.
include apps/tutorial/CMakeFiles/torus.dir/depend.make

# Include the progress variables for this target.
include apps/tutorial/CMakeFiles/torus.dir/progress.make

# Include the compile flags for this target's objects.
include apps/tutorial/CMakeFiles/torus.dir/flags.make

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o: apps/tutorial/CMakeFiles/torus.dir/flags.make
apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o: ../../apps/tutorial/Torus.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/torus.dir/Torus.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/Torus.cpp

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/torus.dir/Torus.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/Torus.cpp > CMakeFiles/torus.dir/Torus.cpp.i

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/torus.dir/Torus.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/Torus.cpp -o CMakeFiles/torus.dir/Torus.cpp.s

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.requires:
.PHONY : apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.requires

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.provides: apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.requires
	$(MAKE) -f apps/tutorial/CMakeFiles/torus.dir/build.make apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.provides.build
.PHONY : apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.provides

apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.provides.build: apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o

# Object files for target torus
torus_OBJECTS = \
"CMakeFiles/torus.dir/Torus.cpp.o"

# External object files for target torus
torus_EXTERNAL_OBJECTS =

apps/tutorial/torus: apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o
apps/tutorial/torus: apps/tutorial/CMakeFiles/torus.dir/build.make
apps/tutorial/torus: src/libgalois.a
apps/tutorial/torus: apps/tutorial/CMakeFiles/torus.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable torus"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/torus.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/tutorial/CMakeFiles/torus.dir/build: apps/tutorial/torus
.PHONY : apps/tutorial/CMakeFiles/torus.dir/build

apps/tutorial/CMakeFiles/torus.dir/requires: apps/tutorial/CMakeFiles/torus.dir/Torus.cpp.o.requires
.PHONY : apps/tutorial/CMakeFiles/torus.dir/requires

apps/tutorial/CMakeFiles/torus.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/torus.dir/cmake_clean.cmake
.PHONY : apps/tutorial/CMakeFiles/torus.dir/clean

apps/tutorial/CMakeFiles/torus.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/tutorial /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial/CMakeFiles/torus.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/tutorial/CMakeFiles/torus.dir/depend

