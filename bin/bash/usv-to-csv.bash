#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that converts USV to CSV.
#
# Note this script is a simple demo, and does not attempt to escape CSV output,
# such as create a double-quoted unit to protect an embedded comma or newline.

escape=false
comma=''

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
            comma=','
            ;;
        "␞")
            printf "\n"
            comma=''
            ;;
        "␝")
            >&2 printf "\nerror: group separator\n"
            ;;
        "␜")
            >&2 printf "\nerror: file separator\n"
            ;;
        "␗")
            break
            ;;
        "␖")
            ;;
        *)
            printf %s%s "$comma" "$c"
            comma=''
            ;;
        esac
    fi
done
