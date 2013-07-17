#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
SET(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "galois" for configuration "Release"
SET_PROPERTY(TARGET galois APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
SET_TARGET_PROPERTIES(galois PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "-lpthread"
  IMPORTED_LOCATION_RELEASE "/usr/local/lib/libgalois.a"
  )

LIST(APPEND _IMPORT_CHECK_TARGETS galois )
LIST(APPEND _IMPORT_CHECK_FILES_FOR_galois "/usr/local/lib/libgalois.a" )

# Import target "graph-convert" for configuration "Release"
SET_PROPERTY(TARGET graph-convert APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
SET_TARGET_PROPERTIES(graph-convert PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/local/bin/graph-convert"
  )

LIST(APPEND _IMPORT_CHECK_TARGETS graph-convert )
LIST(APPEND _IMPORT_CHECK_FILES_FOR_graph-convert "/usr/local/bin/graph-convert" )

# Import target "graph-convert-standalone" for configuration "Release"
SET_PROPERTY(TARGET graph-convert-standalone APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
SET_TARGET_PROPERTIES(graph-convert-standalone PROPERTIES
  IMPORTED_LOCATION_RELEASE "/usr/local/bin/graph-convert-standalone"
  )

LIST(APPEND _IMPORT_CHECK_TARGETS graph-convert-standalone )
LIST(APPEND _IMPORT_CHECK_FILES_FOR_graph-convert-standalone "/usr/local/bin/graph-convert-standalone" )

# Loop over all imported files and verify that they actually exist
FOREACH(target ${_IMPORT_CHECK_TARGETS} )
  FOREACH(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    IF(NOT EXISTS "${file}" )
      MESSAGE(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    ENDIF()
  ENDFOREACH()
  UNSET(_IMPORT_CHECK_FILES_FOR_${target})
ENDFOREACH()
UNSET(_IMPORT_CHECK_TARGETS)

# Commands beyond this point should not need to know the version.
SET(CMAKE_IMPORT_FILE_VERSION)
