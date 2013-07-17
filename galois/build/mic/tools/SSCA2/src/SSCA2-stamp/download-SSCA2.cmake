message(STATUS "downloading...
     src='http://www.graphanalysis.org/benchmark/SSCA2-2.2.tar.gz'
     dst='/home1/02556/rbrito/UT_Internship/galois/build/mic/tools/SSCA2/src/SSCA2/SSCA2-2.2.tar.gz'
     timeout='none'")

file(DOWNLOAD
  "http://www.graphanalysis.org/benchmark/SSCA2-2.2.tar.gz"
  "/home1/02556/rbrito/UT_Internship/galois/build/mic/tools/SSCA2/src/SSCA2/SSCA2-2.2.tar.gz"
  SHOW_PROGRESS
  # no EXPECTED_MD5
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://www.graphanalysis.org/benchmark/SSCA2-2.2.tar.gz' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")
