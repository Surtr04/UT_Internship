message(STATUS "downloading...
     src='http://www.cs.cmu.edu/~pbbs/benchmarks/maximalIndependentSet.tar'
     dst='/home1/02556/rbrito/UT_Internship/galois/build/mic/tools/independentset-pbbs/src/independentset-pbbs/maximalIndependentSet.tar'
     timeout='none'")

file(DOWNLOAD
  "http://www.cs.cmu.edu/~pbbs/benchmarks/maximalIndependentSet.tar"
  "/home1/02556/rbrito/UT_Internship/galois/build/mic/tools/independentset-pbbs/src/independentset-pbbs/maximalIndependentSet.tar"
  SHOW_PROGRESS
  # no EXPECTED_MD5
  # no TIMEOUT
  STATUS status
  LOG log)

list(GET status 0 status_code)
list(GET status 1 status_string)

if(NOT status_code EQUAL 0)
  message(FATAL_ERROR "error: downloading 'http://www.cs.cmu.edu/~pbbs/benchmarks/maximalIndependentSet.tar' failed
  status_code: ${status_code}
  status_string: ${status_string}
  log: ${log}
")
endif()

message(STATUS "downloading... done")