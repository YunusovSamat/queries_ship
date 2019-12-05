#!/usr/bin/python3

import sys

last_key = None
bucket = dict()

for line in sys.stdin:
    key, dict_values = line.rstrip().split('\t')
    tag, value = dict_values[1:-1].split(':')

    if last_key and last_key != key:
        if 'Classes' in bucket:
            for classes_country in bucket['Classes']:
                if 'Ships' in bucket:
                    for ships_name in bucket['Ships']:
                        print(f'{last_key}\t{ships_name}\t{classes_country}')
        bucket.clear()
        bucket[tag] = [value]
        last_key = key
    else:
        if tag not in bucket:
            bucket[tag] = [value]
        else:
            bucket[tag].append(value)
        last_key = key

if last_key:
    if 'Classes' in bucket:
        for classes_country in bucket['Classes']:
            if 'Ships' in bucket:
                for ships_name in bucket['Ships']:
                    print(f'{last_key}\t{ships_name}\t{classes_country}')
