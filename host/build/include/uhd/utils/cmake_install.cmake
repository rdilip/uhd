# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd/utils

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/utils" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/algorithm.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/assert_has.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/assert_has.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/atomic.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/byteswap.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/byteswap.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/cast.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/csv.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/fp_compare_delta.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/fp_compare_epsilon.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/gain_group.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/log.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/math.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/msg_task.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/paths.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/pimpl.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/platform.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/safe_call.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/safe_main.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/static.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/tasks.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/thread_priority.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/utils" TYPE FILE FILES "/home/thompsonlab/Documents/uhd/host/include/uhd/utils/thread_priority.h")
endif()

