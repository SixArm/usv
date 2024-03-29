#!/usr/bin/env python3

# USV example shell script that converts USV to CSV.
#
# Note this script is a simple demo, and does not attempt to escape CSV output,
# such as create a double-quoted unit to protect an embedded comma or newline.

import io
import sys
sys.stdin.reconfigure(encoding='utf-8')
sys.stdout.reconfigure(encoding='utf-8')
escape = False
comma = ''

while True:
    c = sys.stdin.read(1)
    if c == '':
        break
    if escape:
        escape = False
        print(f"{c}", end='', flush=True)
    else:
        match c:
            case "\u001B" | "␛":
                escape = True
            case "\u001F" | "␟":
                comma=','
            case "\u001E" | "␞":
                print(f"\n", end='', flush=True)
                comma = ''
            case "\u001D" | "␝":
                raise Exception("error: group separator")
            case "\u001C" | "␜":
                raise Exception("error: file separator")
            case "\u0004" | "␄":
                break
            case (c):
                print(f"{comma}{c}", end='', flush=True)
                comma = ''
