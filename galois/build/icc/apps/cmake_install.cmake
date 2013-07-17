# Install script for directory: /home1/02556/rbrito/UT_Internship/galois/apps

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "Release")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "0")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/avi/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/barneshut/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/betweennesscentrality/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/bfs/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/boruvka/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/clustering/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/connectedcomponents/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/delaunayrefinement/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/delaunaytriangulation/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/des/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/independentset/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/kruskal/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/gmetis/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/matching/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/pta/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/preflowpush/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/sssp/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/surveypropagation/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/spanningtree/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/tutorial/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

