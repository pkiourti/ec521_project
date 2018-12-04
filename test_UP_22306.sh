#!/bin/sh

# Interact with port 22306 in test_UP
perl -e '$trail_len=2; printf "LOGT" . pack("V", 0x1) . pack("V", 16) . pack("V", $trail_len) . "\xff"x$trail_len' | nc 192.168.0.201 22306 -q 0 | hd
