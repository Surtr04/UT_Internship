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

# Utility rule file for more-scalefree-graphs.

# Include the progress variables for this target.
include inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/progress.make

inputs/scalefree/CMakeFiles/more-scalefree-graphs: inputs/scalefree/rmat8-2e14.gr
inputs/scalefree/CMakeFiles/more-scalefree-graphs: inputs/scalefree/rmat8-2e18.gr
inputs/scalefree/CMakeFiles/more-scalefree-graphs: inputs/scalefree/rmat8-2e26.gr

inputs/scalefree/rmat8-2e14.gr: inputs/scalefree/rmat8-2e14.dimacs
inputs/scalefree/rmat8-2e14.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e14.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr rmat8-2e14.dimacs rmat8-2e14.gr

inputs/scalefree/rmat8-2e18.gr: inputs/scalefree/rmat8-2e18.dimacs
inputs/scalefree/rmat8-2e18.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e18.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr rmat8-2e18.dimacs rmat8-2e18.gr

inputs/scalefree/rmat8-2e26.gr: inputs/scalefree/rmat8-2e26.dimacs
inputs/scalefree/rmat8-2e26.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e26.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr rmat8-2e26.dimacs rmat8-2e26.gr

inputs/scalefree/rmat8-2e14.dimacs: tools/bin/GTgraph-rmat
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e14.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && python /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/generators/rmat.py /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/bin/GTgraph-rmat -n 16384 -m 131072 rmat8-2e14.rmat

inputs/scalefree/rmat8-2e18.dimacs: tools/bin/GTgraph-rmat
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e18.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && python /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/generators/rmat.py /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/bin/GTgraph-rmat -n 262144 -m 2097152 rmat8-2e18.rmat

inputs/scalefree/rmat8-2e26.dimacs: tools/bin/GTgraph-rmat
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating rmat8-2e26.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && python /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/generators/rmat.py /home1/02556/rbrito/UT_Internship/galois/build/icc/tools/bin/GTgraph-rmat -n 67108864 -m 536870912 rmat8-2e26.rmat

more-scalefree-graphs: inputs/scalefree/CMakeFiles/more-scalefree-graphs
more-scalefree-graphs: inputs/scalefree/rmat8-2e14.gr
more-scalefree-graphs: inputs/scalefree/rmat8-2e18.gr
more-scalefree-graphs: inputs/scalefree/rmat8-2e26.gr
more-scalefree-graphs: inputs/scalefree/rmat8-2e14.dimacs
more-scalefree-graphs: inputs/scalefree/rmat8-2e18.dimacs
more-scalefree-graphs: inputs/scalefree/rmat8-2e26.dimacs
more-scalefree-graphs: inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/build.make
.PHONY : more-scalefree-graphs

# Rule to build all files generated by this target.
inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/build: more-scalefree-graphs
.PHONY : inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/build

inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree && $(CMAKE_COMMAND) -P CMakeFiles/more-scalefree-graphs.dir/cmake_clean.cmake
.PHONY : inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/clean

inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/inputs/scalefree /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : inputs/scalefree/CMakeFiles/more-scalefree-graphs.dir/depend
