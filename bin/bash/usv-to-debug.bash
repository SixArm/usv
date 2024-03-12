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
            printf %s "\nescaped special character: " "$c"
            ;;
        "\n")
            printf %s "\nescaped newline character" "$c"
            ;;
        *)
            printf %s "\nescaped typical character: " "$c"
            ;;
        esac
    else
        case  "$c" in
        "␛")
            printf "\nescape\n"
            escape=true
            ;;
        "␟")
            printf "\nunit separator\n"
            ;;
        "␞")
            printf "\nrecord separator\n"
            ;;
        "␝")
            printf "\ngroup separator\n"
            ;;
        "␜")
            printf "\nfile separator\n"
            ;;
        "␗")
            printf "\nend of transmission block\n"
            break
            ;;
        "␖")
            printf "\synchronous idle\n"
            ;;
        *)
            printf %s "$c"
            ;;
        esac
    fi
done
printf "\n"