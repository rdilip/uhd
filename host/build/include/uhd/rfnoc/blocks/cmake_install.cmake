# Install script for directory: /home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/uhd/rfnoc/blocks" TYPE FILE FILES
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/radio_x300.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/block.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/fir.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/duc.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/fifo.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/ddc.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/siggen.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/dma_fifo.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/ddc_single.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/window.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/fosphor.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/logpwr.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/packetresizer.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/addsub.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/fft.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/ofdmeq.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/nullblock.xml"
    "/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc/blocks/keep_one_in_n.xml"
    )
endif()

