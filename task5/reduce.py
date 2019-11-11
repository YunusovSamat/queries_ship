#!/usr/bin/python3

import sys

class_ship = str()
for line in sys.stdin:
    if '!' in line:
        ship = line.rstrip().rstrip('!')
        if ship == class_ship:
            print(ship)
    else:
        class_ship = line.rstrip()
