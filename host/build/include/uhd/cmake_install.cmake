# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/build_info.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/config.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/convert.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/deprecated.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/device.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/exception.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/property_tree.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/property_tree.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/stream.hpp"
    "/home/thompsonlab/Documents/uhd/host/build/include/uhd/version.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/config.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/error.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/rfnoc/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/transport/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/types/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/cal/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/usrp/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/usrp_clock/cmake_install.cmake")
  include("/home/thompsonlab/Documents/uhd/host/build/include/uhd/utils/cmake_install.cmake")

endif()

