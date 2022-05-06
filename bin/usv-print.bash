#!/usr/local/bin/bash
while IFS= read -n1 -r c; do
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
    *)
        printf %s "$c"
        ;;
    esac
done
