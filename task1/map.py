#!/usr/bin/python3

import sys

for line in sys.stdin:
    ship, battle, result = line.rstrip().split('!')
    if battle == 'North Atlantic' and result == 'sunk':
        print(ship)
