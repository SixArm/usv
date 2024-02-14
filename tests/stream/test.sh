#!/bin/sh
set -euf
top="$(git rev-parse --show-toplevel)"
cat "$top/examples/stream.usv" | "$top/bin/usv-to-debug.bash" > output-actual.txt
diff output-actual.txt output-expect.txt
