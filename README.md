# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that places Unicode characters between data parts.

* ␟ = U+241F = US = Unit Separator. Use between each data unit, database column, spreadsheet cell, etc.

* ␞ = U+241E = RS = Record Separator. Use between each data record, database row, spreadsheet line, etc.

* ␝ = U+241D = GS = Group Separator. Use between each data group, database table, spreadsheet grid, etc.

* ␜ = U+241C = FS = File separator. Use between each data file, database schema, spreadsheet folio, etc.

The USV file name extension is ".usv".

The USV repo is <https://github.com/sixarm/usv>.

If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know most of USV.

If you want more capabilties, then try Unicode separated values extensions (USVX), which adds these extras:

* whitespace trim, so you can use whitespace around any USV character.

* backslash escape, so you can protect any USV character within your data content.

* final newline, so your files can be more compatible with some editors and tools.

The USVX file name extension for USVX is ".usvx".

The USVX repo is <https://github.com/sixarm/usvx>.

If you know about comma separated values (CSV) with optional whitespace trim, or tab separated values (TSV) with optional character escaping, or ASCII separated values (ASV) with optional final newline, then you already know most of USVX.


## Documentation

Documentation files here:

* [Frequently asked questions](doc/faq.md)

* [How to type USV Unicode characters](doc/how-to-type-usv-unicode-characters.md)

* [TODO list](doc/todo.md)

* [BNF: Backus-Naur form for standarization](doc/bnf.md)

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons.md)

* [Objections to USV and USVX](doc/objections.md)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values.md)


## Examples

USV with 2 units:

```
a␟b
```

USV with 2 units by 2 records:

```
a␟b␞c␟d
```

USV with 2 units by 2 records by 2 groups:

```
a␟b␞c␟d␝e␟f␞g␟h
```

USV with 2 units by 2 records by 2 groups by 2 files:

```
a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p
```


## USV is easy and friendly

USV is intended to be easy to use and friendly to try:

USV works with many kinds of data. Any data can contain any characters except the four USV characters.

USV works with many kinds of editors. Any editor that can render the USV characters will work. We use vi, emacs, Coda, Notepad++, TextMate, Sublime, VS Code, etc.

USV works with many kinds of tools. Any tool that can parse the USV characters will work. We use awk, sed, grep, rg, miller, etc.

USV works with many kinds of languages. Any language that can handle UTF-8 character encoding and rendering should work. We use C, Go, Java, JavaScript, Julia, Python, R, Ruby, Rust, Swift, PHP, etc.


## Why use USV?

USV can handle data that contains commas, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines (similar to CSV and TSV) and also groups/tables/grids and files/schemas/folios (similar to ASV).

USV is aiming to be an international standard.

USV uses Unicode characters that are semantically meaningful.

USV works well with any typical Unicode editor, any typical Unicode language, and any typical Unicode font.

USV uses visible letter-width characters, and these are easy to view, select, copy, paste, search.

USV works well within typical shell scripts.

USV works well within typical search tools.

USV is simpler and clearer to use and write because there are no escape characters.



## Example USV scripts

Create an example USV file with 2 units by 2 records:

```
$ echo 'a␟b␞c␟d' > example.usv
```

Convert USV to CSV by using `sed`:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g;'
a,b
c,d
```

Convert USV to TSV by using `tr`:

```sh
$ cat example.usv | tr ␟␞ ',\n'
a,b
c,d
```

Create an example USV file with 2 units by 2 records by 2 groups by 2 files:

```sh
echo "a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p" > example.usv
```

Convert USV to TSV by using `awk`:

```sh
$ cat example.usv | awk 'BEGIN { FS="␟"; RS="␞"; OFS=","; ORS="\n"; } {$1=$1}1' | grep -v ^$
```

Print USV with typical shell commands and pretty output:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g; s/␝/\n---\n/g; s/␜/\n===\n/g;'
a,b
c,d
---
e,f
g,h
===
i,j
k,l
---
m,n
o,p
```

Print USV characters by using a shell script with `bash`:

```bash
#!/usr/local/bin/bash
set -euf -o pipefail

# USV example shell script that demonstrates the use of USV characters.
# This script reads STDIN one character at a time, and prints output.
# There is a similar USVX example shell script that demonstrates
# extensions for whitespace trimming and backslash escaping.

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
```


## Conclusion

USV is simple and fast, without extras.

USVX adds extras for whitespace trim, backslash escape, and final newline.

USV and USVX are helping us with many data format projects, and we hope USV may be able to help you too.

We welcome constructive feeback about USV and USVX, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>

<https://github.com/sixarm/usvx>
