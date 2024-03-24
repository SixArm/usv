#!/usr/bin/env python3
import re
s = "a␟b␟␞c␟d␟␞␝e␟f␟␞g␟h␟␞␝␜i␟j␟␞k␟l␟␞␝m␟n␟␞o␟p␟␞␝␜";

def usv(string):
    transmission = re.split(r'[\u0004|\u2404]', string)[0]
    for file in re.split('[\n\r]*[\u001C\u241C][\n\r]*', transmission)[:-1]:
        print(f'file: {file}')
        for group in re.split('[\n\r]*[\u001D\u241D][\n\r]*', file)[:-1]:
            print(f'group: {group}')
            for record in re.split('[\n\r]*[\u001E\u241E][\n\r]*', group)[:-1]:
                print(f'record: {record}')
                for unit in re.split('[\n\r]*[\u001F\u241F][\n\r]*', record)[:-1]:
                    print(f'unit: {unit}')
