# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that uses Unicode symbol characters between data parts. If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know much of USV.

The USV file name extension is ".usv".

The USV repo is <https://github.com/sixarm/usv>.


## USV characters

For Units, Records, Groups, Files:

* ␟ U+241F Symbol for Unit Separator (US).<br>
  Use it between each data unit, database field, spreadsheet cell, etc.

* ␞ U+241E Symbol for Record Separator (RS).<br>
  Use it between each data record, database row, spreadsheet line, etc.

* ␝ U+241D Symbol for Group Separator (GS).<br>
  Use it between each data group, database table, spreadsheet grid, etc.

* ␜ U+241C Symbol for File Separator (FS).<br>
  Use it between each data file, database schema, spreadsheet folio, etc.

For Hierarchy Levels:

* ␏ U+240F Symbol for Shift In (SI).<br>
  Use it to shift inward a level, for nesting, blocks, outlines, etc.

* ␎ U+240E Symbol for Shift Out (SO).<br>
  Use it to shift outward a level, for nesting, blocks, outlines, etc.

For Adjustments:

* ␛ U+241B Symbol for Escape separator (ESC).<br>
  Use it to escape the next character.

* ␗ U+2417 Symbol For End of Transmission Block (EOT).<br>
  Use it to exit the processing i.e. stop parsing here.


## Documentation

Documentation files here:

* [Frequently asked questions](doc/faq.md)

* [How to type Unicode characters](doc/how-to-type-unicode-characters.md)

* [TODO list](doc/todo.md)

* [BNF: Backus-Naur form for standarization](doc/bnf.md)

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons.md)

* [Objections to USV](doc/objections.md)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values.md)


## What is a unit?

A unit represents one item. For example, one database field, one spreadsheet cell, etc.

USV with 2 units:

```usv
a␟b
```

Pretty print:

```sh
a,b
```

## What is a record?

A record is a collection of units. For example, a database row is a collection of database fields, and a spreadsheet line is a collection of spreadsheet cells, etc.

USV with 2 units by 2 records:

```usv
a␟b␞c␟d
```
Pretty print:

```txt
a,b
c,d
```

### What is a group?

A group is a collection of records. For example, a database table is a collection of database rows, and a spreadsheet grid is a collection of spreadsheet lines, etc.

USV with 2 units by 2 records by 2 groups:

```usv
a␟b␞c␟d␝e␟f␞g␟h
```

Pretty print:

```txt
a,b
c,d
-
e,f
g,h
```

### What is a file?

A file is a collection of groups. For example, a database schema is a collection of database tables, and a spreadsheet folio is a collection of spreadsheet grids, etc.

USV with 2 units by 2 records by 2 groups by 2 files:

```usv
a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p
```

Pretty print:

```txt
a,b
c,d
-
e,f
g,h
=
i,j
k,l
-
m,n
o,p
```


## What is a hierarchy?

A hierarchy is a way to nest data. A hierarchy is made of hierarchy levels.

USV with a shift in and shift out:

```usv
color␏red␎
```

Pretty print:

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

Pretty print:

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

## USV is easy and friendly

USV is intended to be easy to use and friendly to try:

USV works with many kinds of data. Any data can contain any characters except the five USV characters.

USV works with many kinds of editors. Any editor that can render the USV characters will work. We use vi, emacs, Coda, Notepad++, TextMate, Sublime, VS Code, etc.

USV works with many kinds of tools. Any tool that can parse the USV characters will work. We use awk, sed, grep, rg, miller, etc.

USV works with many kinds of languages. Any language that can handle UTF-8 character encoding and rendering should work. We use C, C++, C#, Elixir, Erlang, Go, Java, JavaScript, Julia, Kotlin, Perl, PHP, Python, R, Ruby, Rust, Swift, TypeScript, etc.


## Why use USV?

USV can handle data that contains commas, semicolons, quotes, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines (similar to CSV) and groups/tables/grids and files/schemas/folios (similar to ASV).

USV aims to be an international standard.

USV uses Unicode characters that are semantically meaningful.

USV works well with any typical modern editor, font, terminal, shell, search, and language.

USV uses visible letter-width characters, and these are easy to view, select, copy, paste, search.


## Example USV script with character parsing

Print USV characters by using a shell script with `bash`:

```bash
#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false

while IFS= read -n1 -r c; do
    if [ "$escape" = true ]; then
        printf %s "$c"
        escape=false
        continue
    fi
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
    "␏")
        printf "\nshift in\n"
        ;;
    "␎")
        printf "\nshift out\n"
        ;;
    "␗")
        printf "\nend of transmission block\n"
        break
        ;;
    *)
        printf %s "$c"
        ;;
    esac
done
```


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>
