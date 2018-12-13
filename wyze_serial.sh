#!/bin/sh
# might need to turn off hardware flow-control if running for the first time
# run sudo minicom; press CTRL-A; press z; press o; goto serial port setup; press f;
export SERIAL=`echo -n "/dev/";dmesg |grep tty|grep USB|rev|awk '{print $1;exit}'|rev`
DATE=$(date +"%Y_%m_%d_%H%M")
sudo minicom -b 115200 -8 $SERIAL -C $DATE.txt
