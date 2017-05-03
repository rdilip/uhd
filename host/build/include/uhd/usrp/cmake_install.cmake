# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd/usrp

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/usrp" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/fe_connection.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_base.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_eeprom.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_id.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_iface.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_manager.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/gps_ctrl.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/gpio_defs.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/mboard_eeprom.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/subdev_spec.hpp"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/multi_usrp.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/uhd/usrp" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/dboard_eeprom.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/mboard_eeprom.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/subdev_spec.h"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/usrp/usrp.h"
    )
endif()

