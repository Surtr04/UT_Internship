FILE(REMOVE_RECURSE
  "CMakeFiles/bfs-pbbs"
  "CMakeFiles/bfs-pbbs-complete"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-install"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-mkdir"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-download"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-update"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-patch"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-configure"
  "bfs-pbbs/src/bfs-pbbs-stamp/bfs-pbbs-build"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/bfs-pbbs.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
