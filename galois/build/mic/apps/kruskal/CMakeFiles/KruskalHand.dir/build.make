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
include apps/kruskal/CMakeFiles/KruskalHand.dir/depend.make

# Include the progress variables for this target.
include apps/kruskal/CMakeFiles/KruskalHand.dir/progress.make

# Include the compile flags for this target's objects.
include apps/kruskal/CMakeFiles/KruskalHand.dir/flags.make

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o: apps/kruskal/CMakeFiles/KruskalHand.dir/flags.make
apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o: ../../apps/kruskal/KruskalHand.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/kruskal/KruskalHand.cpp

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/KruskalHand.dir/KruskalHand.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/kruskal/KruskalHand.cpp > CMakeFiles/KruskalHand.dir/KruskalHand.cpp.i

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/KruskalHand.dir/KruskalHand.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/kruskal/KruskalHand.cpp -o CMakeFiles/KruskalHand.dir/KruskalHand.cpp.s

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.requires:
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.requires

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.provides: apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.requires
	$(MAKE) -f apps/kruskal/CMakeFiles/KruskalHand.dir/build.make apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.provides.build
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.provides

apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.provides.build: apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o

# Object files for target KruskalHand
KruskalHand_OBJECTS = \
"CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o"

# External object files for target KruskalHand
KruskalHand_EXTERNAL_OBJECTS =

apps/kruskal/KruskalHand: apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o
apps/kruskal/KruskalHand: apps/kruskal/CMakeFiles/KruskalHand.dir/build.make
apps/kruskal/KruskalHand: src/libgalois.a
apps/kruskal/KruskalHand: apps/kruskal/CMakeFiles/KruskalHand.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable KruskalHand"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/KruskalHand.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/kruskal/CMakeFiles/KruskalHand.dir/build: apps/kruskal/KruskalHand
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/build

apps/kruskal/CMakeFiles/KruskalHand.dir/requires: apps/kruskal/CMakeFiles/KruskalHand.dir/KruskalHand.cpp.o.requires
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/requires

apps/kruskal/CMakeFiles/KruskalHand.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal && $(CMAKE_COMMAND) -P CMakeFiles/KruskalHand.dir/cmake_clean.cmake
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/clean

apps/kruskal/CMakeFiles/KruskalHand.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/kruskal /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/kruskal/CMakeFiles/KruskalHand.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/kruskal/CMakeFiles/KruskalHand.dir/depend

