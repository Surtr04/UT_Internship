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
include apps/avi/CMakeFiles/AVIodgExplicit.dir/depend.make

# Include the progress variables for this target.
include apps/avi/CMakeFiles/AVIodgExplicit.dir/progress.make

# Include the compile flags for this target's objects.
include apps/avi/CMakeFiles/AVIodgExplicit.dir/flags.make

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o: apps/avi/CMakeFiles/AVIodgExplicit.dir/flags.make
apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o: ../../apps/avi/main/AVIodgExplicit.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicit.cpp

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicit.cpp > CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.i

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicit.cpp -o CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.s

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.requires:
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.requires

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.provides: apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.requires
	$(MAKE) -f apps/avi/CMakeFiles/AVIodgExplicit.dir/build.make apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.provides.build
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.provides

apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.provides.build: apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o

# Object files for target AVIodgExplicit
AVIodgExplicit_OBJECTS = \
"CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o"

# External object files for target AVIodgExplicit
AVIodgExplicit_EXTERNAL_OBJECTS =

apps/avi/AVIodgExplicit: apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o
apps/avi/AVIodgExplicit: apps/avi/CMakeFiles/AVIodgExplicit.dir/build.make
apps/avi/AVIodgExplicit: apps/avi/libAVI.a
apps/avi/AVIodgExplicit: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_gf_lp64.so
apps/avi/AVIodgExplicit: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_intel_lp64.so
apps/avi/AVIodgExplicit: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_intel_thread.so
apps/avi/AVIodgExplicit: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_core.so
apps/avi/AVIodgExplicit: /opt/apps/intel/13/composer_xe_2013.2.146/compiler/lib/intel64/libiomp5.so
apps/avi/AVIodgExplicit: src/libgalois.a
apps/avi/AVIodgExplicit: /usr/lib64/libz.so
apps/avi/AVIodgExplicit: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_system.so
apps/avi/AVIodgExplicit: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_iostreams.so
apps/avi/AVIodgExplicit: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_filesystem.so
apps/avi/AVIodgExplicit: apps/avi/CMakeFiles/AVIodgExplicit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable AVIodgExplicit"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AVIodgExplicit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/avi/CMakeFiles/AVIodgExplicit.dir/build: apps/avi/AVIodgExplicit
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/build

apps/avi/CMakeFiles/AVIodgExplicit.dir/requires: apps/avi/CMakeFiles/AVIodgExplicit.dir/main/AVIodgExplicit.cpp.o.requires
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/requires

apps/avi/CMakeFiles/AVIodgExplicit.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && $(CMAKE_COMMAND) -P CMakeFiles/AVIodgExplicit.dir/cmake_clean.cmake
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/clean

apps/avi/CMakeFiles/AVIodgExplicit.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/avi /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi/CMakeFiles/AVIodgExplicit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/avi/CMakeFiles/AVIodgExplicit.dir/depend

