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
include src/mm/CMakeFiles/mm.dir/depend.make

# Include the progress variables for this target.
include src/mm/CMakeFiles/mm.dir/progress.make

# Include the compile flags for this target's objects.
include src/mm/CMakeFiles/mm.dir/flags.make

src/mm/CMakeFiles/mm.dir/Mem.cpp.o: src/mm/CMakeFiles/mm.dir/flags.make
src/mm/CMakeFiles/mm.dir/Mem.cpp.o: ../../src/mm/Mem.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/mm/CMakeFiles/mm.dir/Mem.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mm.dir/Mem.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/mm/Mem.cpp

src/mm/CMakeFiles/mm.dir/Mem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mm.dir/Mem.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/mm/Mem.cpp > CMakeFiles/mm.dir/Mem.cpp.i

src/mm/CMakeFiles/mm.dir/Mem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mm.dir/Mem.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/mm/Mem.cpp -o CMakeFiles/mm.dir/Mem.cpp.s

src/mm/CMakeFiles/mm.dir/Mem.cpp.o.requires:
.PHONY : src/mm/CMakeFiles/mm.dir/Mem.cpp.o.requires

src/mm/CMakeFiles/mm.dir/Mem.cpp.o.provides: src/mm/CMakeFiles/mm.dir/Mem.cpp.o.requires
	$(MAKE) -f src/mm/CMakeFiles/mm.dir/build.make src/mm/CMakeFiles/mm.dir/Mem.cpp.o.provides.build
.PHONY : src/mm/CMakeFiles/mm.dir/Mem.cpp.o.provides

src/mm/CMakeFiles/mm.dir/Mem.cpp.o.provides.build: src/mm/CMakeFiles/mm.dir/Mem.cpp.o

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o: src/mm/CMakeFiles/mm.dir/flags.make
src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o: ../../src/mm/NumaMem.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mm.dir/NumaMem.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/mm/NumaMem.cpp

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mm.dir/NumaMem.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/mm/NumaMem.cpp > CMakeFiles/mm.dir/NumaMem.cpp.i

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mm.dir/NumaMem.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/mm/NumaMem.cpp -o CMakeFiles/mm.dir/NumaMem.cpp.s

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.requires:
.PHONY : src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.requires

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.provides: src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.requires
	$(MAKE) -f src/mm/CMakeFiles/mm.dir/build.make src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.provides.build
.PHONY : src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.provides

src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.provides.build: src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o: src/mm/CMakeFiles/mm.dir/flags.make
src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o: ../../src/mm/PageAlloc.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/mm.dir/PageAlloc.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/mm/PageAlloc.cpp

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mm.dir/PageAlloc.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/mm/PageAlloc.cpp > CMakeFiles/mm.dir/PageAlloc.cpp.i

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mm.dir/PageAlloc.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/mm/PageAlloc.cpp -o CMakeFiles/mm.dir/PageAlloc.cpp.s

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.requires:
.PHONY : src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.requires

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.provides: src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.requires
	$(MAKE) -f src/mm/CMakeFiles/mm.dir/build.make src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.provides.build
.PHONY : src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.provides

src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.provides.build: src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o

mm: src/mm/CMakeFiles/mm.dir/Mem.cpp.o
mm: src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o
mm: src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o
mm: src/mm/CMakeFiles/mm.dir/build.make
.PHONY : mm

# Rule to build all files generated by this target.
src/mm/CMakeFiles/mm.dir/build: mm
.PHONY : src/mm/CMakeFiles/mm.dir/build

src/mm/CMakeFiles/mm.dir/requires: src/mm/CMakeFiles/mm.dir/Mem.cpp.o.requires
src/mm/CMakeFiles/mm.dir/requires: src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o.requires
src/mm/CMakeFiles/mm.dir/requires: src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o.requires
.PHONY : src/mm/CMakeFiles/mm.dir/requires

src/mm/CMakeFiles/mm.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm && $(CMAKE_COMMAND) -P CMakeFiles/mm.dir/cmake_clean.cmake
.PHONY : src/mm/CMakeFiles/mm.dir/clean

src/mm/CMakeFiles/mm.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/src/mm /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm /home1/02556/rbrito/UT_Internship/galois/build/icc/src/mm/CMakeFiles/mm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/mm/CMakeFiles/mm.dir/depend

