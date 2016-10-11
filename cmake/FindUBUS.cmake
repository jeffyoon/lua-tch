#
# - Find UBUS
# Find the native UBUS includes and library
#
#  UBUS_INCLUDE_DIRS - where to find uci.h, etc.
#  UBUS_LIBRARIES    - List of libraries when using UBUS.
#  UBUS_FOUND        - True if UBUS found.


IF(NOT UBUS_STUB)
IF (UBUS_INCLUDE_DIRS)
  # Already in cache, be silent
  SET(UBUS_FIND_QUIETLY TRUE)
ENDIF (UBUS_INCLUDE_DIRS)

FIND_PATH(UBUS_INCLUDE_DIR libubus.h)
FIND_PATH(UBOX_INCLUDE_DIR libubox/blobmsg_json.h)

SET(UBUS_NAMES ubus)
FIND_LIBRARY(UBUS_LIBRARY NAMES ${UBUS_NAMES} )
FIND_LIBRARY(UBOX_LIBRARY NAMES ubox )
FIND_LIBRARY(BLOBMSG_LIBRARY NAMES blobmsg_json )

# handle the QUIETLY and REQUIRED arguments and set UBUS_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(UBUS DEFAULT_MSG UBUS_LIBRARY UBUS_INCLUDE_DIR UBOX_INCLUDE_DIR UBOX_LIBRARY BLOBMSG_LIBRARY)

IF(UBUS_FOUND)
  SET( UBUS_LIBRARIES ${UBUS_LIBRARY} ${UBOX_LIBRARY} ${BLOBMSG_LIBRARY})
  SET( UBUS_INCLUDE_DIRS ${UBUS_INCLUDE_DIR} ${UBOX_INCLUDE_DIR} )
ELSE(UBUS_FOUND)
  SET( UBUS_LIBRARIES )
  SET( UBUS_INCLUDE_DIRS )
ENDIF(UBUS_FOUND)

MARK_AS_ADVANCED( UBUS_LIBRARIES UBUS_INCLUDE_DIRS)
ENDIF(NOT UBUS_STUB)