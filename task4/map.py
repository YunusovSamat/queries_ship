#!/usr/bin/python3

import sys

for line in sys.stdin:
    if '|' in line:
        classes = line.rstrip().split('|')
        class_ship = classes[0]
        type_class = classes[1]
        displacement = int(classes[5])
        if type_class == 'bb' and displacement > 3500:
            print(f'{class_ship}')
    else:
        name, class_ship, launched = line.rstrip().split('&')
        if launched.isdigit():
            if int(launched) >= 1922:
                print(f'{class_ship}&{name}')
