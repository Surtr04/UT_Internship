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
include apps/spanningtree/CMakeFiles/spanningtree.dir/depend.make

# Include the progress variables for this target.
include apps/spanningtree/CMakeFiles/spanningtree.dir/progress.make

# Include the compile flags for this target's objects.
include apps/spanningtree/CMakeFiles/spanningtree.dir/flags.make

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o: apps/spanningtree/CMakeFiles/spanningtree.dir/flags.make
apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o: ../../apps/spanningtree/SpanningTree.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/spanningtree.dir/SpanningTree.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/spanningtree/SpanningTree.cpp

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/spanningtree.dir/SpanningTree.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/spanningtree/SpanningTree.cpp > CMakeFiles/spanningtree.dir/SpanningTree.cpp.i

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/spanningtree.dir/SpanningTree.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/spanningtree/SpanningTree.cpp -o CMakeFiles/spanningtree.dir/SpanningTree.cpp.s

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.requires:
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.requires

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.provides: apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.requires
	$(MAKE) -f apps/spanningtree/CMakeFiles/spanningtree.dir/build.make apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.provides.build
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.provides

apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.provides.build: apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o

# Object files for target spanningtree
spanningtree_OBJECTS = \
"CMakeFiles/spanningtree.dir/SpanningTree.cpp.o"

# External object files for target spanningtree
spanningtree_EXTERNAL_OBJECTS =

apps/spanningtree/spanningtree: apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o
apps/spanningtree/spanningtree: apps/spanningtree/CMakeFiles/spanningtree.dir/build.make
apps/spanningtree/spanningtree: src/libgalois.a
apps/spanningtree/spanningtree: apps/spanningtree/CMakeFiles/spanningtree.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable spanningtree"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/spanningtree.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/spanningtree/CMakeFiles/spanningtree.dir/build: apps/spanningtree/spanningtree
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/build

apps/spanningtree/CMakeFiles/spanningtree.dir/requires: apps/spanningtree/CMakeFiles/spanningtree.dir/SpanningTree.cpp.o.requires
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/requires

apps/spanningtree/CMakeFiles/spanningtree.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree && $(CMAKE_COMMAND) -P CMakeFiles/spanningtree.dir/cmake_clean.cmake
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/clean

apps/spanningtree/CMakeFiles/spanningtree.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/spanningtree /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree/CMakeFiles/spanningtree.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/spanningtree/CMakeFiles/spanningtree.dir/depend

