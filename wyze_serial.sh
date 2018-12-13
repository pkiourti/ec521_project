#!/bin/sh
# This script finds first serial device (e.g. /dev/ttyUSB0) and runs minicom on it
# might need to turn off hardware flow-control if running for the first time
# run sudo minicom; press CTRL-A; press z; press o; goto serial_port_setup; press f;
# press enter; save setup as dfl; press exit; CTRL-A; z; x; enter; rerun this script 
export SERIAL=`echo -n "/dev/";dmesg |grep tty|grep USB|rev|awk '{print $1;exit}'|rev`
DATE=$(date +"%Y_%m_%d_%H%M")
sudo minicom -b 115200 -8 $SERIAL -C $DATE.txt
