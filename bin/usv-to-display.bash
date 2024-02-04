#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false
indent=""

while IFS= read -n1 -r c; do
    if [ "$escape" = true ]; then
        printf %s "$c"
        escape=false
        continue
    fi
    case  "$c" in
    "␛")
        escape=true
        ;;
    "␟")
        printf ","
        ;;
    "␞")
        printf "\n%s" "$indent"
        ;;
    "␝")
        printf "\n%s-\n%s" "$indent" "$indent"
        ;;
    "␜")
        printf "\n%s=\n%s" "$indent" "$indent"
        ;;
    "␏")
        printf "\n%s{" "$indent"
        indent="$indent    "
        printf "\n%s" "$indent"
        ;;
    "␎")
        indent=${indent%????}
        printf "\n%s}\n%s" "$indent" "$indent"
        ;;
    "␗")
        break
        ;;
    *)
        printf %s "$c"
        ;;
    esac
done
printf "\n"
