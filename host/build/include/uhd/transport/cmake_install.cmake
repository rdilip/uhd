# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd/transport

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/transport" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/bounded_buffer.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/bounded_buffer.ipp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/buffer_pool.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/chdr.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/if_addrs.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/udp_constants.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/udp_simple.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/udp_zero_copy.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/tcp_zero_copy.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/usb_control.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/usb_zero_copy.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/usb_device_handle.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/vrt_if_packet.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/transport/zero_copy.hpp"
    )
endif()

