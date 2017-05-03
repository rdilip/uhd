# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd/types

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/types" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/byte_vector.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/clock_config.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/device_addr.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/dict.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/dict.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/direction.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/endianness.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/io_type.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/mac_addr.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/metadata.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/otw_type.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/ranges.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/ref_vector.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/sensors.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/serial.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/sid.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/stream_cmd.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/time_spec.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/tune_request.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/tune_result.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/wb_iface.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/filters.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/types" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/metadata.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/ranges.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/sensors.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/string_vector.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/tune_request.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/tune_result.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/types/usrp_info.h"
    )
endif()

