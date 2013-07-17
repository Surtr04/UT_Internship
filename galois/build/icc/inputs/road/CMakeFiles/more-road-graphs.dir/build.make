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

# Utility rule file for more-road-graphs.

# Include the progress variables for this target.
include inputs/road/CMakeFiles/more-road-graphs.dir/progress.make

inputs/road/CMakeFiles/more-road-graphs: inputs/road/USA-road-d.USA.gr
inputs/road/CMakeFiles/more-road-graphs: inputs/road/USA-road-d.W.gr
inputs/road/CMakeFiles/more-road-graphs: inputs/road/USA-road-d.NY.gr

inputs/road/USA-road-d.USA.gr: inputs/road/USA-road-d.USA.dimacs
inputs/road/USA-road-d.USA.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.USA.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr USA-road-d.USA.dimacs USA-road-d.USA.gr

inputs/road/USA-road-d.W.gr: inputs/road/USA-road-d.W.dimacs
inputs/road/USA-road-d.W.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.W.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr USA-road-d.W.dimacs USA-road-d.W.gr

inputs/road/USA-road-d.NY.gr: inputs/road/USA-road-d.NY.dimacs
inputs/road/USA-road-d.NY.gr: tools/graph-convert-standalone/graph-convert-standalone
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.NY.gr"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && ../../tools/graph-convert-standalone/graph-convert-standalone -dimacs2gr USA-road-d.NY.dimacs USA-road-d.NY.gr

inputs/road/USA-road-d.USA.dimacs: inputs/road/USA-road-d.USA.gz
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.USA.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /bin/gunzip -c USA-road-d.USA.gz > USA-road-d.USA.dimacs

inputs/road/USA-road-d.W.dimacs: inputs/road/USA-road-d.W.gz
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.W.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /bin/gunzip -c USA-road-d.W.gz > USA-road-d.W.dimacs

inputs/road/USA-road-d.NY.dimacs: inputs/road/USA-road-d.NY.gz
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.NY.dimacs"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /bin/gunzip -c USA-road-d.NY.gz > USA-road-d.NY.dimacs

inputs/road/USA-road-d.USA.gz:
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.USA.gz"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /usr/bin/wget -O USA-road-d.USA.gz http://www.dis.uniroma1.it/~challenge9/data/USA-road-d/USA-road-d.USA.gr.gz

inputs/road/USA-road-d.W.gz:
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.W.gz"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /usr/bin/wget -O USA-road-d.W.gz http://www.dis.uniroma1.it/~challenge9/data/USA-road-d/USA-road-d.W.gr.gz

inputs/road/USA-road-d.NY.gz:
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating USA-road-d.NY.gz"
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && /usr/bin/wget -O USA-road-d.NY.gz http://www.dis.uniroma1.it/~challenge9/data/USA-road-d/USA-road-d.NY.gr.gz

more-road-graphs: inputs/road/CMakeFiles/more-road-graphs
more-road-graphs: inputs/road/USA-road-d.USA.gr
more-road-graphs: inputs/road/USA-road-d.W.gr
more-road-graphs: inputs/road/USA-road-d.NY.gr
more-road-graphs: inputs/road/USA-road-d.USA.dimacs
more-road-graphs: inputs/road/USA-road-d.W.dimacs
more-road-graphs: inputs/road/USA-road-d.NY.dimacs
more-road-graphs: inputs/road/USA-road-d.USA.gz
more-road-graphs: inputs/road/USA-road-d.W.gz
more-road-graphs: inputs/road/USA-road-d.NY.gz
more-road-graphs: inputs/road/CMakeFiles/more-road-graphs.dir/build.make
.PHONY : more-road-graphs

# Rule to build all files generated by this target.
inputs/road/CMakeFiles/more-road-graphs.dir/build: more-road-graphs
.PHONY : inputs/road/CMakeFiles/more-road-graphs.dir/build

inputs/road/CMakeFiles/more-road-graphs.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road && $(CMAKE_COMMAND) -P CMakeFiles/more-road-graphs.dir/cmake_clean.cmake
.PHONY : inputs/road/CMakeFiles/more-road-graphs.dir/clean

inputs/road/CMakeFiles/more-road-graphs.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/icc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/inputs/road /home1/02556/rbrito/UT_Internship/galois/build/icc /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road /home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/road/CMakeFiles/more-road-graphs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : inputs/road/CMakeFiles/more-road-graphs.dir/depend
