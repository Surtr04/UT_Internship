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
include apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/depend.make

# Include the progress variables for this target.
include apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/progress.make

# Include the compile flags for this target's objects.
include apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/flags.make

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/flags.make
apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o: ../../apps/avi/main/AVIodgExplicitNoLock.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicitNoLock.cpp

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicitNoLock.cpp > CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.i

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/avi/main/AVIodgExplicitNoLock.cpp -o CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.s

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.requires:
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.requires

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.provides: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.requires
	$(MAKE) -f apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/build.make apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.provides.build
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.provides

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.provides.build: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o

# Object files for target AVIodgExplicitNoLock
AVIodgExplicitNoLock_OBJECTS = \
"CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o"

# External object files for target AVIodgExplicitNoLock
AVIodgExplicitNoLock_EXTERNAL_OBJECTS =

apps/avi/AVIodgExplicitNoLock: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o
apps/avi/AVIodgExplicitNoLock: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/build.make
apps/avi/AVIodgExplicitNoLock: apps/avi/libAVI.a
apps/avi/AVIodgExplicitNoLock: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_gf_lp64.so
apps/avi/AVIodgExplicitNoLock: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_intel_lp64.so
apps/avi/AVIodgExplicitNoLock: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_intel_thread.so
apps/avi/AVIodgExplicitNoLock: /opt/apps/intel/13/composer_xe_2013.2.146/mkl/lib/intel64/libmkl_core.so
apps/avi/AVIodgExplicitNoLock: /opt/apps/intel/13/composer_xe_2013.2.146/compiler/lib/intel64/libiomp5.so
apps/avi/AVIodgExplicitNoLock: src/libgalois.a
apps/avi/AVIodgExplicitNoLock: /usr/lib64/libz.so
apps/avi/AVIodgExplicitNoLock: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_system.so
apps/avi/AVIodgExplicitNoLock: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_iostreams.so
apps/avi/AVIodgExplicitNoLock: /home1/02556/rbrito/boost_1_54_0/stage/lib/libboost_filesystem.so
apps/avi/AVIodgExplicitNoLock: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable AVIodgExplicitNoLock"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/AVIodgExplicitNoLock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/build: apps/avi/AVIodgExplicitNoLock
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/build

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/requires: apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/main/AVIodgExplicitNoLock.cpp.o.requires
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/requires

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi && $(CMAKE_COMMAND) -P CMakeFiles/AVIodgExplicitNoLock.dir/cmake_clean.cmake
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/clean

apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/avi /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi /home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/avi/CMakeFiles/AVIodgExplicitNoLock.dir/depend
