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
include apps/tutorial/CMakeFiles/sssp-simple.dir/depend.make

# Include the progress variables for this target.
include apps/tutorial/CMakeFiles/sssp-simple.dir/progress.make

# Include the compile flags for this target's objects.
include apps/tutorial/CMakeFiles/sssp-simple.dir/flags.make

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o: apps/tutorial/CMakeFiles/sssp-simple.dir/flags.make
apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o: ../../apps/tutorial/SSSPsimple.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/SSSPsimple.cpp

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/SSSPsimple.cpp > CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.i

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/tutorial/SSSPsimple.cpp -o CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.s

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.requires:
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.requires

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.provides: apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.requires
	$(MAKE) -f apps/tutorial/CMakeFiles/sssp-simple.dir/build.make apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.provides.build
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.provides

apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.provides.build: apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o

# Object files for target sssp-simple
sssp__simple_OBJECTS = \
"CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o"

# External object files for target sssp-simple
sssp__simple_EXTERNAL_OBJECTS =

apps/tutorial/sssp-simple: apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o
apps/tutorial/sssp-simple: apps/tutorial/CMakeFiles/sssp-simple.dir/build.make
apps/tutorial/sssp-simple: src/libgalois.a
apps/tutorial/sssp-simple: apps/tutorial/CMakeFiles/sssp-simple.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable sssp-simple"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sssp-simple.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/tutorial/CMakeFiles/sssp-simple.dir/build: apps/tutorial/sssp-simple
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/build

apps/tutorial/CMakeFiles/sssp-simple.dir/requires: apps/tutorial/CMakeFiles/sssp-simple.dir/SSSPsimple.cpp.o.requires
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/requires

apps/tutorial/CMakeFiles/sssp-simple.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial && $(CMAKE_COMMAND) -P CMakeFiles/sssp-simple.dir/cmake_clean.cmake
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/clean

apps/tutorial/CMakeFiles/sssp-simple.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/tutorial /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/tutorial/CMakeFiles/sssp-simple.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/tutorial/CMakeFiles/sssp-simple.dir/depend

