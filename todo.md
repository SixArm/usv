# TODO

## Shift

For Hierarchy Levels:

* ␏ U+240F Symbol for Shift In (SI).<br>
  Use it to shift inward a level, for nesting, blocks, outlines, etc.

* ␎ U+240E Symbol for Shift Out (SO).<br>
  Use it to shift outward a level, for nesting, blocks, outlines, etc.


## What is a hierarchy?

Some data projects need more flexibility. For example, some data projects don't fit neatly into units, records, groups, files, because the data contains more kinds of clusters, or has nested clusters, etc.

For these needs, USV enables you to create your own hierarchy. If you know about data representations such as JSON, YAML, TOML, then you already understand how hierarchy works.

Example JSON hierarchy:

```
{
    "colors": [
        "red",
        "green",
        "blue"
    ]
}
```

USV uses two hierarchy characters:

* "shift-in" goes inward a.k.a. begins a deeper hierarchy level.
  
* "shift-out" goes outward a.k.a. ends a deeper hierarchy level.

USV with a shift-in and a shift-out:

```usv
color␏red␎
```

Pretty print renders shift-in as a left brace, and shift-out as brace, and with indentation:

```txt
color
{ 
  red
}
```

USV with 2 shift ins and 2 shift outs:

```usv
colors␏red␏scarlet␎green␏emerald␎blue␏cerulean␎␎
```

Pretty print renders with even more indentation:

```sh
colors
{
    red
    {
        scarlet
    }
    green
    {
        emerald
    }
    blue
    {
        cerulean
    }
}
```


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
