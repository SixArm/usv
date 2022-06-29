#!/usr/local/bin/bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints output.
# This handles whitespace trim, backslash escape, and final newline.

state="start"
escape=false
whitespace=""
while IFS= read -n1 -r c; do
    if [ "$escape" = true ]; then
        printf %s "$c"
        escape=false
    else
        case "$c" in
        "␟"|"␞"|"␝"|"␜")
            case  "$c" in
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
            esac
            state="start"
            whitespace=""
            ;;
        "␛")
            escape=true
            ;;
        " "|"\t"|"\n"|"\r")
            if [ "$state" = "content" ]; then
                whitespace="$whitespace$c"
            fi
            ;;
        *)
            state="content"
            printf %s "$whitespace$c"
            whitespace=""
            ;;
        esac
    fi
done
printf "\n";
