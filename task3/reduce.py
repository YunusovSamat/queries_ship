#!/usr/bin/python3

import sys

last_key = None
ships_list = list()
for line in sys.stdin:
    if '&' in line:
        ships = line.strip().split('&')
        key = ships[0]
        if last_key and last_key != key:
            ships_list.clear()
        ships_list.append(ships)
    else:
        class_ship, country, numGuns = line.strip().split('|')
        key = class_ship
        if last_key and last_key != key:
            ships_list.clear()
        for ships in ships_list:
            print(f'{class_ship}\t{ships[1]}\t{country}')
    last_key = key
