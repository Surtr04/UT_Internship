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
include test/CMakeFiles/test-lock.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/test-lock.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/test-lock.dir/flags.make

test/CMakeFiles/test-lock.dir/lock.cpp.o: test/CMakeFiles/test-lock.dir/flags.make
test/CMakeFiles/test-lock.dir/lock.cpp.o: ../../test/lock.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object test/CMakeFiles/test-lock.dir/lock.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-lock.dir/lock.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/test/lock.cpp

test/CMakeFiles/test-lock.dir/lock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-lock.dir/lock.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/test/lock.cpp > CMakeFiles/test-lock.dir/lock.cpp.i

test/CMakeFiles/test-lock.dir/lock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-lock.dir/lock.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/test/lock.cpp -o CMakeFiles/test-lock.dir/lock.cpp.s

test/CMakeFiles/test-lock.dir/lock.cpp.o.requires:
.PHONY : test/CMakeFiles/test-lock.dir/lock.cpp.o.requires

test/CMakeFiles/test-lock.dir/lock.cpp.o.provides: test/CMakeFiles/test-lock.dir/lock.cpp.o.requires
	$(MAKE) -f test/CMakeFiles/test-lock.dir/build.make test/CMakeFiles/test-lock.dir/lock.cpp.o.provides.build
.PHONY : test/CMakeFiles/test-lock.dir/lock.cpp.o.provides

test/CMakeFiles/test-lock.dir/lock.cpp.o.provides.build: test/CMakeFiles/test-lock.dir/lock.cpp.o

# Object files for target test-lock
test__lock_OBJECTS = \
"CMakeFiles/test-lock.dir/lock.cpp.o"

# External object files for target test-lock
test__lock_EXTERNAL_OBJECTS =

test/test-lock: test/CMakeFiles/test-lock.dir/lock.cpp.o
test/test-lock: test/CMakeFiles/test-lock.dir/build.make
test/test-lock: src/libgalois.a
test/test-lock: test/CMakeFiles/test-lock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-lock"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-lock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/test-lock.dir/build: test/test-lock
.PHONY : test/CMakeFiles/test-lock.dir/build

test/CMakeFiles/test-lock.dir/requires: test/CMakeFiles/test-lock.dir/lock.cpp.o.requires
.PHONY : test/CMakeFiles/test-lock.dir/requires

test/CMakeFiles/test-lock.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/test && $(CMAKE_COMMAND) -P CMakeFiles/test-lock.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/test-lock.dir/clean

test/CMakeFiles/test-lock.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/test /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/test /home1/02556/rbrito/UT_Internship/galois/build/icc/test/CMakeFiles/test-lock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/test-lock.dir/depend

