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
include apps/des/CMakeFiles/DESunordered.dir/depend.make

# Include the progress variables for this target.
include apps/des/CMakeFiles/DESunordered.dir/progress.make

# Include the compile flags for this target's objects.
include apps/des/CMakeFiles/DESunordered.dir/flags.make

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o: apps/des/CMakeFiles/DESunordered.dir/flags.make
apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o: ../../apps/des/unordered/DESunordered.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/des/unordered/DESunordered.cpp

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/des/unordered/DESunordered.cpp > CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.i

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/des/unordered/DESunordered.cpp -o CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.s

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.requires:
.PHONY : apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.requires

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.provides: apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.requires
	$(MAKE) -f apps/des/CMakeFiles/DESunordered.dir/build.make apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.provides.build
.PHONY : apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.provides

apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.provides.build: apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o: apps/des/CMakeFiles/DESunordered.dir/flags.make
apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o: ../../apps/des/common/comDefs.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DESunordered.dir/common/comDefs.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/des/common/comDefs.cpp

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DESunordered.dir/common/comDefs.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/des/common/comDefs.cpp > CMakeFiles/DESunordered.dir/common/comDefs.cpp.i

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DESunordered.dir/common/comDefs.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/des/common/comDefs.cpp -o CMakeFiles/DESunordered.dir/common/comDefs.cpp.s

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.requires:
.PHONY : apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.requires

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.provides: apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.requires
	$(MAKE) -f apps/des/CMakeFiles/DESunordered.dir/build.make apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.provides.build
.PHONY : apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.provides

apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.provides.build: apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o: apps/des/CMakeFiles/DESunordered.dir/flags.make
apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o: ../../apps/des/logic/LogicGate.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/LogicGate.cpp

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/LogicGate.cpp > CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.i

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/LogicGate.cpp -o CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.s

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.requires:
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.requires

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.provides: apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.requires
	$(MAKE) -f apps/des/CMakeFiles/DESunordered.dir/build.make apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.provides.build
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.provides

apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.provides.build: apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o: apps/des/CMakeFiles/DESunordered.dir/flags.make
apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o: ../../apps/des/logic/NetlistParser.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/NetlistParser.cpp

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/NetlistParser.cpp > CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.i

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/NetlistParser.cpp -o CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.s

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.requires:
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.requires

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.provides: apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.requires
	$(MAKE) -f apps/des/CMakeFiles/DESunordered.dir/build.make apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.provides.build
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.provides

apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.provides.build: apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o: apps/des/CMakeFiles/DESunordered.dir/flags.make
apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o: ../../apps/des/logic/BasicPort.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home1/02556/rbrito/UT_Internship/galois/build/mic/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o -c /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/BasicPort.cpp

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.i"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -E /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/BasicPort.cpp > CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.i

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.s"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && /opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc  $(CXX_DEFINES) $(CXX_FLAGS) -S /home1/02556/rbrito/UT_Internship/galois/apps/des/logic/BasicPort.cpp -o CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.s

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.requires:
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.requires

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.provides: apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.requires
	$(MAKE) -f apps/des/CMakeFiles/DESunordered.dir/build.make apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.provides.build
.PHONY : apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.provides

apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.provides.build: apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o

# Object files for target DESunordered
DESunordered_OBJECTS = \
"CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o" \
"CMakeFiles/DESunordered.dir/common/comDefs.cpp.o" \
"CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o" \
"CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o" \
"CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o"

# External object files for target DESunordered
DESunordered_EXTERNAL_OBJECTS =

apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/build.make
apps/des/DESunordered: src/libgalois.a
apps/des/DESunordered: apps/des/CMakeFiles/DESunordered.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable DESunordered"
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DESunordered.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/des/CMakeFiles/DESunordered.dir/build: apps/des/DESunordered
.PHONY : apps/des/CMakeFiles/DESunordered.dir/build

apps/des/CMakeFiles/DESunordered.dir/requires: apps/des/CMakeFiles/DESunordered.dir/unordered/DESunordered.cpp.o.requires
apps/des/CMakeFiles/DESunordered.dir/requires: apps/des/CMakeFiles/DESunordered.dir/common/comDefs.cpp.o.requires
apps/des/CMakeFiles/DESunordered.dir/requires: apps/des/CMakeFiles/DESunordered.dir/logic/LogicGate.cpp.o.requires
apps/des/CMakeFiles/DESunordered.dir/requires: apps/des/CMakeFiles/DESunordered.dir/logic/NetlistParser.cpp.o.requires
apps/des/CMakeFiles/DESunordered.dir/requires: apps/des/CMakeFiles/DESunordered.dir/logic/BasicPort.cpp.o.requires
.PHONY : apps/des/CMakeFiles/DESunordered.dir/requires

apps/des/CMakeFiles/DESunordered.dir/clean:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des && $(CMAKE_COMMAND) -P CMakeFiles/DESunordered.dir/cmake_clean.cmake
.PHONY : apps/des/CMakeFiles/DESunordered.dir/clean

apps/des/CMakeFiles/DESunordered.dir/depend:
	cd /home1/02556/rbrito/UT_Internship/galois/build/mic && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home1/02556/rbrito/UT_Internship/galois /home1/02556/rbrito/UT_Internship/galois/apps/des /home1/02556/rbrito/UT_Internship/galois/build/mic /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des /home1/02556/rbrito/UT_Internship/galois/build/mic/apps/des/CMakeFiles/DESunordered.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/des/CMakeFiles/DESunordered.dir/depend
