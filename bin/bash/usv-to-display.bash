#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false

while IFS= read -N1 -r c; do
    if [ "$escape" = true ]; then
        escape=false
        printf %s "$c"
    else
        case  "$c" in
        "\u001B" | "␛")
            escape=true
            ;;
        "\u001F" | "␟")
            printf ","
            ;;
        "\u001E" | "␞")
            printf "\n"
            ;;
        "\u001D" | "␝")
            printf "\n-\n"
            ;;
        "\u001C" | "␜")
            printf "\n=\n"
            ;;
        "\u0004" | "␄")
            break
            ;;
        *)
            printf %s "$c"
            ;;
        esac
    fi
done
printf "\n"
