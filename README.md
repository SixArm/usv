# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that places Unicode characters between data parts:

* ␟ = U+241F = US = Unit Separator. Use between each data unit, database column, spreadsheet cell, etc.

* ␞ = U+241E = RS = Record Separator. Use between each data record, database row, spreadsheet line, etc.

* ␝ = U+241D = GS = Group Separator. Use between each data group, database table, spreadsheet grid, etc.

* ␜ = U+241C = FS = File separator. Use between each data file, database schema, spreadsheet folio, etc.

If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know about USV.

Documentation:

* [Frequently asked questions](doc/faq.md)

* [How to type USV Unicode characters](doc/how-to-type-usv-unicode-characters.md)

* [TODO list](doc/todo.md)

* [BNF: Backus-Naur form for standarization](doc/bnf.md)

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons.md)

* [Objections to USV](doc/objections.md)

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



## Example scripts

Create an example USV file with 3 units by 3 records:

```
$ echo 'a␟b␟c␞d␟e␟f␞g␟h␟i' > example.usv
```

Convert USV to CSV by using `sed`:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g;' 
```

Convert USV to TSV by using `tr`:

```sh
$ cat example.usv | tr ␟␞ ',\n'
```

Convert USV to TSV by using `awk`:

```sh
$ cat example.usv | awk 'BEGIN { FS="␟"; RS="␞"; OFS=","; ORS="\n"; } {$1=$1}1' | grep -v ^$
```

Display USV with typical shell commands and pretty output:

```sh
$ echo "a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p" | 
  sed 's/␟/,/g; s/␞/\n/g; s/␝/\n---\n/g; s/␜/\n===\n/g;'
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


## Conclusion

USV is helping us with real-world data format projects, and we hope USV can be helpful to you too.

We welcome constructive feeback about USV, as well as git issues, pull requests, and standardization help.
