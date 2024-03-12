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
                print(f"\nescaped special character: {c}\n", end='', flush=True)
            case "\n":
                print(f"\nescaped newline character\n", end='', flush=True)
            case (c):
                print(f"\nescaped typical character: {c}\n", end='', flush=True)
    else:
        match c:
            case "␛":
                print("\nescape\n", end='', flush=True)
                escape = True
            case "␟":
                print(f"\nunit separator\n", end='', flush=True)
            case "␞":
                print(f"\nrecord separator\n", end='', flush=True)
            case "␝":
                print(f"\ngroup separator\n", end='', flush=True)
            case "␜":
                print(f"\nfile separator\n", end='', flush=True)
            case "␗":
                print(f"\nend of transmission block\n", end='', flush=True)
                break
            case "␖":
                print(f"\nsynchronous idle\n", end='', flush=True)
            case (c):
                print(f"{c}", end='', flush=True)
print()
