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
include src/CMakeFiles/galois.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/galois.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/galois.dir/flags.make

src/CMakeFiles/galois.dir/Barrier.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Barrier.cpp.o: ../../src/Barrier.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Barrier.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Barrier.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Barrier.cpp

src/CMakeFiles/galois.dir/Barrier.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Barrier.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Barrier.cpp > CMakeFiles/galois.dir/Barrier.cpp.i

src/CMakeFiles/galois.dir/Barrier.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Barrier.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Barrier.cpp -o CMakeFiles/galois.dir/Barrier.cpp.s

src/CMakeFiles/galois.dir/Barrier.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Barrier.cpp.o.requires

src/CMakeFiles/galois.dir/Barrier.cpp.o.provides: src/CMakeFiles/galois.dir/Barrier.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Barrier.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Barrier.cpp.o.provides

src/CMakeFiles/galois.dir/Barrier.cpp.o.provides.build: src/CMakeFiles/galois.dir/Barrier.cpp.o

src/CMakeFiles/galois.dir/Context.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Context.cpp.o: ../../src/Context.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Context.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Context.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Context.cpp

src/CMakeFiles/galois.dir/Context.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Context.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Context.cpp > CMakeFiles/galois.dir/Context.cpp.i

src/CMakeFiles/galois.dir/Context.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Context.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Context.cpp -o CMakeFiles/galois.dir/Context.cpp.s

src/CMakeFiles/galois.dir/Context.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Context.cpp.o.requires

src/CMakeFiles/galois.dir/Context.cpp.o.provides: src/CMakeFiles/galois.dir/Context.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Context.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Context.cpp.o.provides

src/CMakeFiles/galois.dir/Context.cpp.o.provides.build: src/CMakeFiles/galois.dir/Context.cpp.o

src/CMakeFiles/galois.dir/FileGraph.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/FileGraph.cpp.o: ../../src/FileGraph.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/FileGraph.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/FileGraph.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/FileGraph.cpp

src/CMakeFiles/galois.dir/FileGraph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/FileGraph.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/FileGraph.cpp > CMakeFiles/galois.dir/FileGraph.cpp.i

src/CMakeFiles/galois.dir/FileGraph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/FileGraph.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/FileGraph.cpp -o CMakeFiles/galois.dir/FileGraph.cpp.s

src/CMakeFiles/galois.dir/FileGraph.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/FileGraph.cpp.o.requires

src/CMakeFiles/galois.dir/FileGraph.cpp.o.provides: src/CMakeFiles/galois.dir/FileGraph.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/FileGraph.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/FileGraph.cpp.o.provides

src/CMakeFiles/galois.dir/FileGraph.cpp.o.provides.build: src/CMakeFiles/galois.dir/FileGraph.cpp.o

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o: ../../src/FileGraphParallel.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/FileGraphParallel.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/FileGraphParallel.cpp

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/FileGraphParallel.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/FileGraphParallel.cpp > CMakeFiles/galois.dir/FileGraphParallel.cpp.i

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/FileGraphParallel.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/FileGraphParallel.cpp -o CMakeFiles/galois.dir/FileGraphParallel.cpp.s

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.requires

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.provides: src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.provides

src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.provides.build: src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o: ../../src/PerThreadStorage.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/PerThreadStorage.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/PerThreadStorage.cpp

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/PerThreadStorage.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/PerThreadStorage.cpp > CMakeFiles/galois.dir/PerThreadStorage.cpp.i

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/PerThreadStorage.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/PerThreadStorage.cpp -o CMakeFiles/galois.dir/PerThreadStorage.cpp.s

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.requires

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.provides: src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.provides

src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.provides.build: src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o

src/CMakeFiles/galois.dir/PreAlloc.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/PreAlloc.cpp.o: ../../src/PreAlloc.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/PreAlloc.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/PreAlloc.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/PreAlloc.cpp

src/CMakeFiles/galois.dir/PreAlloc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/PreAlloc.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/PreAlloc.cpp > CMakeFiles/galois.dir/PreAlloc.cpp.i

src/CMakeFiles/galois.dir/PreAlloc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/PreAlloc.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/PreAlloc.cpp -o CMakeFiles/galois.dir/PreAlloc.cpp.s

src/CMakeFiles/galois.dir/PreAlloc.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/PreAlloc.cpp.o.requires

src/CMakeFiles/galois.dir/PreAlloc.cpp.o.provides: src/CMakeFiles/galois.dir/PreAlloc.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/PreAlloc.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/PreAlloc.cpp.o.provides

src/CMakeFiles/galois.dir/PreAlloc.cpp.o.provides.build: src/CMakeFiles/galois.dir/PreAlloc.cpp.o

src/CMakeFiles/galois.dir/Sampling.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Sampling.cpp.o: ../../src/Sampling.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Sampling.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Sampling.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Sampling.cpp

src/CMakeFiles/galois.dir/Sampling.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Sampling.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Sampling.cpp > CMakeFiles/galois.dir/Sampling.cpp.i

src/CMakeFiles/galois.dir/Sampling.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Sampling.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Sampling.cpp -o CMakeFiles/galois.dir/Sampling.cpp.s

src/CMakeFiles/galois.dir/Sampling.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Sampling.cpp.o.requires

src/CMakeFiles/galois.dir/Sampling.cpp.o.provides: src/CMakeFiles/galois.dir/Sampling.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Sampling.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Sampling.cpp.o.provides

src/CMakeFiles/galois.dir/Sampling.cpp.o.provides.build: src/CMakeFiles/galois.dir/Sampling.cpp.o

src/CMakeFiles/galois.dir/Support.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Support.cpp.o: ../../src/Support.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Support.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Support.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Support.cpp

src/CMakeFiles/galois.dir/Support.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Support.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Support.cpp > CMakeFiles/galois.dir/Support.cpp.i

src/CMakeFiles/galois.dir/Support.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Support.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Support.cpp -o CMakeFiles/galois.dir/Support.cpp.s

src/CMakeFiles/galois.dir/Support.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Support.cpp.o.requires

src/CMakeFiles/galois.dir/Support.cpp.o.provides: src/CMakeFiles/galois.dir/Support.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Support.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Support.cpp.o.provides

src/CMakeFiles/galois.dir/Support.cpp.o.provides.build: src/CMakeFiles/galois.dir/Support.cpp.o

src/CMakeFiles/galois.dir/Termination.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Termination.cpp.o: ../../src/Termination.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Termination.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Termination.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Termination.cpp

src/CMakeFiles/galois.dir/Termination.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Termination.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Termination.cpp > CMakeFiles/galois.dir/Termination.cpp.i

src/CMakeFiles/galois.dir/Termination.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Termination.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Termination.cpp -o CMakeFiles/galois.dir/Termination.cpp.s

src/CMakeFiles/galois.dir/Termination.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Termination.cpp.o.requires

src/CMakeFiles/galois.dir/Termination.cpp.o.provides: src/CMakeFiles/galois.dir/Termination.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Termination.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Termination.cpp.o.provides

src/CMakeFiles/galois.dir/Termination.cpp.o.provides.build: src/CMakeFiles/galois.dir/Termination.cpp.o

src/CMakeFiles/galois.dir/Threads.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Threads.cpp.o: ../../src/Threads.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Threads.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Threads.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Threads.cpp

src/CMakeFiles/galois.dir/Threads.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Threads.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Threads.cpp > CMakeFiles/galois.dir/Threads.cpp.i

src/CMakeFiles/galois.dir/Threads.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Threads.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Threads.cpp -o CMakeFiles/galois.dir/Threads.cpp.s

src/CMakeFiles/galois.dir/Threads.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Threads.cpp.o.requires

src/CMakeFiles/galois.dir/Threads.cpp.o.provides: src/CMakeFiles/galois.dir/Threads.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Threads.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Threads.cpp.o.provides

src/CMakeFiles/galois.dir/Threads.cpp.o.provides.build: src/CMakeFiles/galois.dir/Threads.cpp.o

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o: ../../src/ThreadPool_pthread.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/ThreadPool_pthread.cpp

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/ThreadPool_pthread.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/ThreadPool_pthread.cpp > CMakeFiles/galois.dir/ThreadPool_pthread.cpp.i

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/ThreadPool_pthread.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/ThreadPool_pthread.cpp -o CMakeFiles/galois.dir/ThreadPool_pthread.cpp.s

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.requires

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.provides: src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.provides

src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.provides.build: src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o

src/CMakeFiles/galois.dir/Timer.cpp.o: src/CMakeFiles/galois.dir/flags.make
src/CMakeFiles/galois.dir/Timer.cpp.o: ../../src/Timer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/galois.dir/Timer.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/galois.dir/Timer.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/src/Timer.cpp

src/CMakeFiles/galois.dir/Timer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/galois.dir/Timer.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/src/Timer.cpp > CMakeFiles/galois.dir/Timer.cpp.i

src/CMakeFiles/galois.dir/Timer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/galois.dir/Timer.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/src/Timer.cpp -o CMakeFiles/galois.dir/Timer.cpp.s

src/CMakeFiles/galois.dir/Timer.cpp.o.requires:
.PHONY : src/CMakeFiles/galois.dir/Timer.cpp.o.requires

src/CMakeFiles/galois.dir/Timer.cpp.o.provides: src/CMakeFiles/galois.dir/Timer.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/galois.dir/build.make src/CMakeFiles/galois.dir/Timer.cpp.o.provides.build
.PHONY : src/CMakeFiles/galois.dir/Timer.cpp.o.provides

src/CMakeFiles/galois.dir/Timer.cpp.o.provides.build: src/CMakeFiles/galois.dir/Timer.cpp.o

# Object files for target galois
galois_OBJECTS = \
"CMakeFiles/galois.dir/Barrier.cpp.o" \
"CMakeFiles/galois.dir/Context.cpp.o" \
"CMakeFiles/galois.dir/FileGraph.cpp.o" \
"CMakeFiles/galois.dir/FileGraphParallel.cpp.o" \
"CMakeFiles/galois.dir/PerThreadStorage.cpp.o" \
"CMakeFiles/galois.dir/PreAlloc.cpp.o" \
"CMakeFiles/galois.dir/Sampling.cpp.o" \
"CMakeFiles/galois.dir/Support.cpp.o" \
"CMakeFiles/galois.dir/Termination.cpp.o" \
"CMakeFiles/galois.dir/Threads.cpp.o" \
"CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o" \
"CMakeFiles/galois.dir/Timer.cpp.o"

# External object files for target galois
galois_EXTERNAL_OBJECTS = \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/Allocator.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/APFloat.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/APInt.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/CommandLine.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/SmallPtrSet.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/SmallVector.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/StringMap.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/StringRef.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/llvm/CMakeFiles/llvm.dir/Twine.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/mm/CMakeFiles/mm.dir/Mem.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/EnvCheck.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/gIO.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/HWTopo.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/HWTopoLinux.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/SimpleLock.cpp.o" \
"/home1/02556/rbrito/UT_Internship/galois/build/mic/src/ll/CMakeFiles/ll.dir/TID.cpp.o"

src/libgalois.a: src/CMakeFiles/galois.dir/Barrier.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Context.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/FileGraph.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/PreAlloc.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Sampling.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Support.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Termination.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Threads.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/Timer.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/Allocator.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/APFloat.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/APInt.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/CommandLine.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/SmallPtrSet.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/SmallVector.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/StringMap.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/StringRef.cpp.o
src/libgalois.a: src/llvm/CMakeFiles/llvm.dir/Twine.cpp.o
src/libgalois.a: src/mm/CMakeFiles/mm.dir/Mem.cpp.o
src/libgalois.a: src/mm/CMakeFiles/mm.dir/NumaMem.cpp.o
src/libgalois.a: src/mm/CMakeFiles/mm.dir/PageAlloc.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/EnvCheck.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/gIO.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/HWTopo.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/HWTopoLinux.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/SimpleLock.cpp.o
src/libgalois.a: src/ll/CMakeFiles/ll.dir/TID.cpp.o
src/libgalois.a: src/CMakeFiles/galois.dir/build.make
src/libgalois.a: src/CMakeFiles/galois.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libgalois.a"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && $(CMAKE_COMMAND) -P CMakeFiles/galois.dir/cmake_clean_target.cmake
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/galois.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/galois.dir/build: src/libgalois.a
.PHONY : src/CMakeFiles/galois.dir/build

src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Barrier.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Context.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/FileGraph.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/FileGraphParallel.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/PerThreadStorage.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/PreAlloc.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Sampling.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Support.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Termination.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Threads.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/ThreadPool_pthread.cpp.o.requires
src/CMakeFiles/galois.dir/requires: src/CMakeFiles/galois.dir/Timer.cpp.o.requires
.PHONY : src/CMakeFiles/galois.dir/requires

src/CMakeFiles/galois.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/src && $(CMAKE_COMMAND) -P CMakeFiles/galois.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/galois.dir/clean

src/CMakeFiles/galois.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/src /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/src /home1/02556/rbrito/UT_Internship/galois/build/mic/src/CMakeFiles/galois.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/galois.dir/depend

