# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that uses Unicode symbol characters between data parts. If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know much of USV.

The USV file name extension is ".usv".

The USV repo is <https://github.com/sixarm/usv>.


## USV characters

USV separators:

* ␟ U+241F Symbol for Unit Separator (US).<br>
  Use between each spreadsheet cell, database field, etc.

* ␞ U+241E Symbol for Record Separator (RS).<br>
  Use between each spreadsheet line, database row, etc.

* ␝ U+241D Symbol for Group Separator (GS).<br>
  Use between each spreadsheet grid, database table, etc.

* ␜ U+241C Symbol for File Separator (FS).<br>
  Use between each spreadsheet folio, database schema, etc.

USV modifiers:

* ␛ U+241B Symbol for Escape separator (ESC).<br>
  Use it to escape the next character i.e. flip meaning.<br>

* ␗ U+2417 Symbol For End of Transmission Block (EOT).<br>
  Use it to exit the processing i.e. stop parsing here.


## Documentation

Documentation files here:

* [Frequently asked questions](doc/faq.md)

* [How to type Unicode characters](doc/how-to-type-unicode-characters.md)

* [TODO list](doc/todo.md)

* [BNF: Backus-Naur form for standardization](doc/bnf.md)

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons.md)

* [Objections to USV](doc/objections.md)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values.md)


## Examples

USV with 2 units i.e. [a,b]:

```usv
a␟b
```

USV with 2 units by 2 records i.e. [[a,b],[c,d]]:

```usv
a␟b␞c␟d
```

USV with 2 units by 2 records by 2 groups i.e. [[[a,b],[c,d]],[[e,f],[g,h]]]

```usv
a␟b␞c␟d␝e␟f␞g␟h
```

USV with 2 units by 2 records by 2 groups by 2 files i.e. [[[[a,b],[c,d]],[[e,f],[g,h]]],[[[i,j],[k,l]],[[m,n],[o,p]]]]

```usv
a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p
```

This is what the USV looks like when you display it with a simple display script, included in this repository:

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
</details> 


## Escape

The escape separator flips the purpose of the subsequent character:

* Escape then a USV character means the character becomes normal data. This is especially useful for protecting special characters.

* Escape then a normal character means the character becomes ignored. This is especially useful to do line continuations.

USV with 2 units, and the first unit contains an Escape + End Transmission Block (ETB); the escaped ETB is content.

```usv
a␛␗b
```

USV with 2 units by 2 records, with each line ending with Escape + newline; the escaped newline is ignorable.

```usv
a␟b␞␛
c␟d␝␛
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

This is a simple example USV script with character parsing. The script is a bash shell script, and should run on any current Unix system or current Bash shell. 

Source: [usv-to-display.bash](bin/usv-to-display.bash)

```bash
#!/usr/bin/env bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints text.

escape=false

while IFS= read -n1 -r c; do
    if [ "$escape" = true ]; then
        escape=false
        case "$c" in 
        "␛"|"␟"|"␞"|"␝"|"␜"|"␗")
            printf %s "\nescaped special character: " "$c"
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
        *)
            printf %s "$c"
            ;;
        esac
    fi
done
printf "\n"
```


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>
