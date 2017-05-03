# Install script for directory: /home/thompsonlab/Documents/uhd/host/tests/devtest

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "tests")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/uhd/tests/devtest" TYPE PROGRAM FILES
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/gpio_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/devtest_b2xx.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/run_testsuite.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/tx_bursts_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/bitbang_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/test_messages_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/devtest_e3xx.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/uhd_test_base.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/benchmark_rate_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/rx_samples_to_file_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/devtest_x3x0.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/usrp_probe_test.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/usrp_probe.py"
    "/home/thompsonlab/Documents/uhd/host/tests/devtest/test_pps_test.py"
    )
endif()

