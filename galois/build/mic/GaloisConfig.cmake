# Config file for the Galois package
# It defines the following variables
#  Galois_INCLUDE_DIRS
#  Galois_LIBRARIES
#  Galois_CXX_COMPILER
#  Galois_CXX_FLAGS

get_filename_component(GALOIS_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(Galois_INCLUDE_DIRS "/home1/02556/rbrito/UT_Internship/galois/include;/home1/02556/rbrito/UT_Internship/galois/build/mic/include")
set(Galois_INCLUDE_DIRS ${Galois_INCLUDE_DIRS} "/home1/02556/rbrito/boost_1_54_0")

if(NOT TARGET galois AND NOT Galois_BINARY_DIR)
  include("${GALOIS_CMAKE_DIR}/GaloisTargets.cmake")
endif()

set(Galois_LIBRARIES galois)
set(Galois_CXX_COMPILER "/opt/apps/intel/13/composer_xe_2013.2.146/bin/intel64/icpc")
set(Galois_CXX_FLAGS "-D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS   -wd68 -wd981 -wd383 -wd869 -wd2196 -wd279 -wd2504 -wd2943 -std=c++11 -g -O3 -DNDEBUG")
