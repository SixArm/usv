#!/usr/bin/env python3

# USV example script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

import io
import sys
sys.stdin.reconfigure(encoding='utf-8')
sys.stdout.reconfigure(encoding='utf-8')
escape = False

while True:
    c = sys.stdin.read(1)
    if c == '':
        break
    if escape:
        escape = False
        match c:
            case "␛" | "␟" | "␞" | "␝" | "␜" | "␗":
                print(f"{c}", end='', flush=True)
    else:
        match c:
            case "␛":
                escape = True
            case "␟":
                print(f",", end='', flush=True)
            case "␞":
                print(f"\n", end='', flush=True)
            case "␝":
                print(f"\n-\n", end='', flush=True)
            case "␜":
                print(f"\n=\n", end='', flush=True)
            case "␗":
                break
            case "␖":
                pass
            case (c):
                print(f"{c}", end='', flush=True)
print()
