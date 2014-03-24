if(NOT LIBOSMOSDR_FOUND)
  pkg_check_modules (LIBOSMOSDR_PKG libosmosdr)
  find_path(LIBOSMOSDR_INCLUDE_DIR NAMES api.h
    PATHS
    ${LIBOSMOSDR_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
    /usr/local/include/osmosdr
  )

  find_library(LIBOSMOSDR_LIBRARIES NAMES gnuradio-osmosdr
    PATHS
    ${LIBOSMOSDR_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

if(LIBOSMOSDR_INCLUDE_DIR AND LIBOSMOSDR_LIBRARIES)
  set(LIBOSMOSDR_FOUND TRUE CACHE INTERNAL "libosmosdr found")
  message(STATUS "Found libosmosdr: ${LIBOSMOSDR_INCLUDE_DIR}, ${LIBOSMOSDR_LIBRARIES}")
else(LIBOSMOSDR_INCLUDE_DIR AND LIBOSMOSDR_LIBRARIES)
  set(LIBOSMOSDR_FOUND FALSE CACHE INTERNAL "libosmosdr found")
  message(STATUS "libosmosdr not found.")
endif(LIBOSMOSDR_INCLUDE_DIR AND LIBOSMOSDR_LIBRARIES)

mark_as_advanced(LIBOSMOSDR_INCLUDE_DIR LIBOSMOSDR_LIBRARIES)

endif(NOT LIBOSMOSDR_FOUND)
