#!/usr/bin/python3

import sys

for line in sys.stdin:
    if '|' in line:
        classes = line.rstrip().split('|')
        class_ship, country, numGuns = classes[0], classes[2], int(classes[3])
        if numGuns >=10:
            print(f'{class_ship}|{country}|{numGuns}')
    else:
        ships = line.rstrip().split('&')
        name, class_ship = ships[0], ships[1]
        print(f'{class_ship}&{name}')
