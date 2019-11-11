#!/usr/bin/python3

import sys

for line in sys.stdin:
    if '|' in line:
        class_ship = line.rstrip().split('|')[0]
        print(class_ship)
    else:
        ship = line.rstrip().split('!')[0]
        print(f'{ship}!')
