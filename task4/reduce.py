#!/usr/bin/python3

import sys

class_ship = str()
for line in sys.stdin:
    if '&' in line:
        ships = line.strip().split('&')
        if ships[0] == class_ship:
            print(ships[1])
    else:
        class_ship = line.rstrip()
