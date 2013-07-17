# Install script for directory: /home1/02556/rbrito/UT_Internship/galois

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

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/cmake/Galois/GaloisConfig.cmake;/usr/local/lib/cmake/Galois/GaloisConfigVersion.cmake")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/usr/local/lib/cmake/Galois" TYPE FILE FILES
    "/home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles/GaloisConfig.cmake"
    "/home1/02556/rbrito/UT_Internship/galois/build/icc/GaloisConfigVersion.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")
  IF(EXISTS "$ENV{DESTDIR}/usr/local/lib/cmake/Galois/GaloisTargets.cmake")
    FILE(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}/usr/local/lib/cmake/Galois/GaloisTargets.cmake"
         "/home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles/Export/_usr/local/lib/cmake/Galois/GaloisTargets.cmake")
    IF(EXPORT_FILE_CHANGED)
      FILE(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}/usr/local/lib/cmake/Galois/GaloisTargets-*.cmake")
      IF(OLD_CONFIG_FILES)
        MESSAGE(STATUS "Old export file \"$ENV{DESTDIR}/usr/local/lib/cmake/Galois/GaloisTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        FILE(REMOVE ${OLD_CONFIG_FILES})
      ENDIF(OLD_CONFIG_FILES)
    ENDIF(EXPORT_FILE_CHANGED)
  ENDIF()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/cmake/Galois/GaloisTargets.cmake")
  IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
  IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/usr/local/lib/cmake/Galois" TYPE FILE FILES "/home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles/Export/_usr/local/lib/cmake/Galois/GaloisTargets.cmake")
  IF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "/usr/local/lib/cmake/Galois/GaloisTargets-release.cmake")
    IF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    ENDIF (CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    IF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
        message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    ENDIF (CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
FILE(INSTALL DESTINATION "/usr/local/lib/cmake/Galois" TYPE FILE FILES "/home1/02556/rbrito/UT_Internship/galois/build/icc/CMakeFiles/Export/_usr/local/lib/cmake/Galois/GaloisTargets-release.cmake")
  ENDIF("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "dev")

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/lib/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/src/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/tools/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/inputs/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/test/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/scripts/cmake_install.cmake")
  INCLUDE("/home1/02556/rbrito/UT_Internship/galois/build/icc/apps/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

IF(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
ELSE(CMAKE_INSTALL_COMPONENT)
  SET(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
ENDIF(CMAKE_INSTALL_COMPONENT)

FILE(WRITE "/home1/02556/rbrito/UT_Internship/galois/build/icc/${CMAKE_INSTALL_MANIFEST}" "")
FOREACH(file ${CMAKE_INSTALL_MANIFEST_FILES})
  FILE(APPEND "/home1/02556/rbrito/UT_Internship/galois/build/icc/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
ENDFOREACH(file)
