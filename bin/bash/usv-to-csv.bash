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
        printf %s "$c"
    else
        case  "$c" in
        "\u001B" | "␛")
            escape=true
            ;;
        "\u001F" | "␟")
            comma=','
            ;;
        "\u001E" | "␞")
            printf "\n"
            comma=''
            ;;
        "\u001D" | "␝")
            >&2 printf "\nerror: group separator\n"
            ;;
        "\u001C" | "␜")
            >&2 printf "\nerror: file separator\n"
            ;;
        "\u0004" | "␄")
            break
            ;;
        *)
            printf %s%s "$comma" "$c"
            comma=''
            ;;
        esac
    fi
done
