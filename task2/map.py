#!/usr/bin/python3

import sys

for line in sys.stdin:
    classes = line.rstrip().split('|')
    class_ship, country, bore = classes[0], classes[2], float(classes[4])
    if bore >= 16:
        print(f'{class_ship}\t{country}')
