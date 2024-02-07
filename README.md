# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that uses Unicode symbol characters between data parts. USV competes with comma separated values (CSV), tab separated values (TSV), ASCII separated values (ASV), and similar systems. USV offers more capabilities and standards-track syntax.

The USV repo is <https://github.com/sixarm/usv>.

The USV file name extension is ".usv".

The USV MIME type is "text/usv".


## USV characters

Separators:

* ␟ U+241F Symbol for Unit Separator (US).

* ␞ U+241E Symbol for Record Separator (RS).

* ␝ U+241D Symbol for Group Separator (GS).

* ␜ U+241C Symbol for File Separator (FS).

Modifiers:

* ␛ U+241B Symbol for Escape (ESC).

* ␗ U+2417 Symbol For End of Transmission Block (EOT).


## Example

This kind of data: 

`[a, b], [c, d]`

Is represented in USV as: 

```
a␟b␞c␟d
```

If you prefer to see one unit per line, you can escape newlines:

```usv
a␟␛
b␞␛
c␟␛
d␞␛
```

If you prefer to see one record per line, you can escape newlines:

```usv
a␟b␞␛
c␟d␞␛
```


## Documentation

Documentation links:

* [Frequently asked questions](doc/faq.md)

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons.md)

* [How to type Unicode characters](doc/how-to-type-unicode-characters.md)

* [BNF: Backus-Naur form for standardization](doc/bnf.md)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values.md)

* [TODO list](doc/todo.md)

Example files:

* [hello-world.usv](examples/hello-world.usv) versus [hello-world.csv](examples/hello-world.csv)

* [zen-koans.usv](examples/zen-koans.usv) versus [zen-koans.csv](examples/koans.csv)
  
* [blog-posts.usv](examples/blog-posts.usv) versus [blog-posts.csv](examples/koans.csv)


## Examples

USV with 2 units by 2 records by 2 groups by 2 files:

```usv
a␟b␞c␟d
```

This is what the USV looks like when you display it with a simple display script included in this repository:

```txt
a,b
c,d
```

USV with 2 units by 2 records by 2 groups by 2 files:

```usv
a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p
```

This is what the USV looks like when you display it with a simple display script included in this repository:

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


## Escape

The escape separator flips the purpose of the subsequent character:

* Escape + USV character: the character becomes content.

* Escape + normal character: the character becomes ignored.

USV with 2 units, and the first unit contains an Escape + End Transmission Block (ETB); the escaped ETB is content.

```usv
a␛␗b
```

USV with 2 units by 2 records, with each line ending with Escape + newline; the escaped newline is ignorable.

```usv
a␟b␞␛
c␟d␝␛
```

Notably, Escape + newline is especially useful for typical text editor line continuations, and also for ending a text editor file with a newline.


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


## Example USV scripts

This repository includes example USV scripts with character parsing. The scripts are a bash shell scripts, and should run on any current Unix system or current Bash shell. 

* [usv-to-display.bash](bin/usv-to-display.bash)

* [usv-to-debug.bash](bin/usv-to-debug.bash)

* [usv-to-csv.bash](bin/usv-to-csv.bash)


## Legal protection for standardization

The USV project aims to become a free open source IANA standard, much like the IANA standard for CSV.

Until the standardization happens, the terms "USV" and "Unicode Separated Values" are trademarks of this project, and this repository is copyright 2022-2024. When IANA approves the standard, then the trademarks and copyrights become public domain.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>
