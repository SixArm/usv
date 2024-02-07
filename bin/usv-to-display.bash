#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false

while IFS= read -N1 -r c; do
    if [ "$escape" = true ]; then
        escape=false
        case "$c" in 
        "␛"|"␟"|"␞"|"␝"|"␜"|"␗")
            printf %s "$c"
            ;;
        esac
    else
        case  "$c" in
        "␛")
            escape=true
            ;;
        "␟")
            printf ","
            ;;
        "␞")
            printf "\n"
            ;;
        "␝")
            printf "\n-\n"
            ;;
        "␜")
            printf "\n=\n"
            ;;
        "␗")
            break
            ;;
        *)
            printf %s "$c"
            ;;
        esac
    fi
done
printf "\n"
