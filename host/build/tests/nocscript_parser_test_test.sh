#!/bin/sh
export PATH=/home/thompsonlab/Documents/uhd/host/build/tests:$PATH
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/home/thompsonlab/Documents/uhd/host/build/lib:/home/thompsonlab/Documents/uhd/host/build/tests:$LD_LIBRARY_PATH
export UHD_RFNOC_DIR=/home/thompsonlab/Documents/uhd/host/include/uhd/rfnoc
nocscript_parser_test 
