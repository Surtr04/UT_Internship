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
CMAKE_BINARY_DIR = /home1/02556/rbrito/UT_Internship/galois/build/icc

# Include any dependencies generated for this target.
include test/CMakeFiles/test-sort.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/test-sort.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/test-sort.dir/flags.make

test/CMakeFiles/test-sort.dir/sort.cpp.o: test/CMakeFiles/test-sort.dir/flags.make
test/CMakeFiles/test-sort.dir/sort.cpp.o: ../../test/sort.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/test-sort.dir/sort.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-sort.dir/sort.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/test/sort.cpp

test/CMakeFiles/test-sort.dir/sort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-sort.dir/sort.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/test/sort.cpp > CMakeFiles/test-sort.dir/sort.cpp.i

test/CMakeFiles/test-sort.dir/sort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-sort.dir/sort.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/test/sort.cpp -o CMakeFiles/test-sort.dir/sort.cpp.s

test/CMakeFiles/test-sort.dir/sort.cpp.o.requires:
.PHONY : test/CMakeFiles/test-sort.dir/sort.cpp.o.requires

test/CMakeFiles/test-sort.dir/sort.cpp.o.provides: test/CMakeFiles/test-sort.dir/sort.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/test-sort.dir/build.make test/CMakeFiles/test-sort.dir/sort.cpp.o.provides.build
.PHONY : test/CMakeFiles/test-sort.dir/sort.cpp.o.provides

test/CMakeFiles/test-sort.dir/sort.cpp.o.provides.build: test/CMakeFiles/test-sort.dir/sort.cpp.o

# Object files for target test-sort
test__sort_OBJECTS = \
"CMakeFiles/test-sort.dir/sort.cpp.o"

# External object files for target test-sort
test__sort_EXTERNAL_OBJECTS =

test/test-sort: test/CMakeFiles/test-sort.dir/sort.cpp.o
test/test-sort: test/CMakeFiles/test-sort.dir/build.make
test/test-sort: src/libgalois.a
test/test-sort: test/CMakeFiles/test-sort.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-sort"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-sort.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/test-sort.dir/build: test/test-sort
.PHONY : test/CMakeFiles/test-sort.dir/build

test/CMakeFiles/test-sort.dir/requires: test/CMakeFiles/test-sort.dir/sort.cpp.o.requires
.PHONY : test/CMakeFiles/test-sort.dir/requires

test/CMakeFiles/test-sort.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && $(CMAKE_COMMAND) -P CMakeFiles/test-sort.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/test-sort.dir/clean

test/CMakeFiles/test-sort.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/test /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/test /home1/02556/rbrito/UT_Internship/galois/build/icc/test/CMakeFiles/test-sort.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/test-sort.dir/depend
