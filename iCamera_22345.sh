#!/bin/sh

# Interact with port 22345 in iCamera
perl -e '@averify=(1, 2, 3, 4); $trailing_bytes=64; $cmd=pack("v", 10002); $len=pack("v", 32+$trailing_bytes); printf "\xff"x4 . "$cmd" . "$len" . "\xda"x8 . pack("V", $averify[0]) . pack("V", $averify[1]) . pack("V", $averify[2]) . pack("V", $averify[3]) . "1"x$trailing_bytes' | nc 192.168.0.201 22345 -q 0 | hd
