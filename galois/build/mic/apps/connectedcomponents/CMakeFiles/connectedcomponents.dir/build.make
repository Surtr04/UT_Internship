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
include apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/depend.make

# Include the progress variables for this target.
include apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/progress.make

# Include the compile flags for this target's objects.
include apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/flags.make

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/flags.make
apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o: ../../apps/connectedcomponents/ConnectedComponents.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/connectedcomponents/ConnectedComponents.cpp

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/connectedcomponents/ConnectedComponents.cpp > CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.i

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/connectedcomponents/ConnectedComponents.cpp -o CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.s

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.requires:
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.requires

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.provides: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.requires
	$(MAKE) -f apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/build.make apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.provides.build
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.provides

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.provides.build: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o

# Object files for target connectedcomponents
connectedcomponents_OBJECTS = \
"CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o"

# External object files for target connectedcomponents
connectedcomponents_EXTERNAL_OBJECTS =

apps/connectedcomponents/connectedcomponents: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o
apps/connectedcomponents/connectedcomponents: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/build.make
apps/connectedcomponents/connectedcomponents: src/libgalois.a
apps/connectedcomponents/connectedcomponents: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable connectedcomponents"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/connectedcomponents.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/build: apps/connectedcomponents/connectedcomponents
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/build

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/requires: apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/ConnectedComponents.cpp.o.requires
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/requires

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents && $(CMAKE_COMMAND) -P CMakeFiles/connectedcomponents.dir/cmake_clean.cmake
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/clean

apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/connectedcomponents /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/connectedcomponents/CMakeFiles/connectedcomponents.dir/depend

