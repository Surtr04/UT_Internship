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
include apps/clustering/CMakeFiles/clustering.dir/depend.make

# Include the progress variables for this target.
include apps/clustering/CMakeFiles/clustering.dir/progress.make

# Include the compile flags for this target's objects.
include apps/clustering/CMakeFiles/clustering.dir/flags.make

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o: apps/clustering/CMakeFiles/clustering.dir/flags.make
apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o: ../../apps/clustering/Clustering.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/clustering.dir/Clustering.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/clustering/Clustering.cpp

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/clustering.dir/Clustering.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/clustering/Clustering.cpp > CMakeFiles/clustering.dir/Clustering.cpp.i

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/clustering.dir/Clustering.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/clustering/Clustering.cpp -o CMakeFiles/clustering.dir/Clustering.cpp.s

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.requires:
.PHONY : apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.requires

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.provides: apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.requires
	$(MAKE) -f apps/clustering/CMakeFiles/clustering.dir/build.make apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.provides.build
.PHONY : apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.provides

apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.provides.build: apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o

# Object files for target clustering
clustering_OBJECTS = \
"CMakeFiles/clustering.dir/Clustering.cpp.o"

# External object files for target clustering
clustering_EXTERNAL_OBJECTS =

apps/clustering/clustering: apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o
apps/clustering/clustering: apps/clustering/CMakeFiles/clustering.dir/build.make
apps/clustering/clustering: src/libgalois.a
apps/clustering/clustering: apps/clustering/CMakeFiles/clustering.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable clustering"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/clustering.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/clustering/CMakeFiles/clustering.dir/build: apps/clustering/clustering
.PHONY : apps/clustering/CMakeFiles/clustering.dir/build

apps/clustering/CMakeFiles/clustering.dir/requires: apps/clustering/CMakeFiles/clustering.dir/Clustering.cpp.o.requires
.PHONY : apps/clustering/CMakeFiles/clustering.dir/requires

apps/clustering/CMakeFiles/clustering.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering && $(CMAKE_COMMAND) -P CMakeFiles/clustering.dir/cmake_clean.cmake
.PHONY : apps/clustering/CMakeFiles/clustering.dir/clean

apps/clustering/CMakeFiles/clustering.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/clustering /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering/CMakeFiles/clustering.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/clustering/CMakeFiles/clustering.dir/depend

