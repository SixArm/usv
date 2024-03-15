#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false

while IFS= read -N1 -r c; do
    if [ "$escape" = true ]; then
        escape=false
        printf %s "\nescape character: " "$c"
    else
        case  "$c" in
        "\u001B" | "␛")
            printf "\nescape\n"
            escape=true
            ;;
        "\u001F" | "␟")
            printf "\nunit separator\n"
            ;;
        "\u001E" | "␞")
            printf "\nrecord separator\n"
            ;;
        "\u001D" | "␝")
            printf "\ngroup separator\n"
            ;;
        "\u001C" | "␜")
            printf "\nfile separator\n"
            ;;
        "\u0004" | "␄")
            printf "\nend of transmission\n"
            break
            ;;
        *)
            printf %s "$c"
            ;;
        esac
    fi
done
printf "\n"
