# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that uses Unicode symbol characters between data parts. 

USV is a text format that is similar to comma separated values (CSV), tab separated values (TSV), ASCII separated values (ASV), etc. USV is most like ASV, which gives better hierarchy than CSV, plus visible symbols for separators and modifiers.

USV offers more capabilities for UTF-8 characters, spreadsheet collections, database collections, and live streaming.

[FAQ](doc/faq/) &bull; [RFC](doc/rfc/) &bull; [Code](doc/code/) &bull; [Comparisons](doc/comparisons/) &bull; [Criticisms](doc/criticisms/) &bull; [TODO](doc/todo/) &bull; [XKCD](https://xkcd.com/927/)


## USV characters

Separators:

* ␟ U+241F Symbol for Unit Separator (US)

* ␞ U+241E Symbol for Record Separator (RS)

* ␝ U+241D Symbol for Group Separator (GS)

* ␜ U+241C Symbol for File Separator (FS)

Modifiers:

* ␛ U+241B Symbol for Escape (ESC)

* ␗ U+2417 Symbol for End of Transmission Block (ETB)

* ␖ U+2416 Symbol For Synchronous Idle (SYN)


## Hello World

This kind of data …

```txt
hello, world
```

… is represented in USV as two units:

```usv
hello␟world␟
```

Optional: if you prefer to see one unit per line, then end each line with a USV escape:

```usv
hello␟␛
world␟␛
```

Optional: you can use the [USV Rust crate](https://crates.io/crates/usv/):

```rust
use usv::*;
let input = "hello␟world␟";
let units = input.units().collect();
```

USV can represent units, records, groups, files. 

* For spreadsheets, think of these as cells, rows, sheets, folios. 

* For databases, think of these as fields, records, tables, schemas. 


## Documentation

Documentation links:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Request For Comments (RFC)](doc/rfc/)

* [Code examples and production crates](doc/code/)
  
* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

* [TODO list](doc/todo/)

Symbol specifics:

* [Escape (ESC)](doc/symbols/escape/)

* [Synchronous Idle (SYN)](doc/symbols/syncronous-idle/)

* [End of Transmission Block (ETB)](doc/symbols/end-of-transmission-block/)

Context help:

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons/)

* [Criticisms and replies](doc/criticisms/)

* [How to type Unicode characters](doc/how-to-type-unicode-characters/)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values/)

Example files:

* [hello-world.usv](examples/hello-world.usv) versus [hello-world.csv](examples/hello-world.csv)

* [zen-koans.usv](examples/zen-koans.usv) versus [zen-koans.csv](examples/zen-koans.csv)

* [blog-posts.usv](examples/blog-posts.usv) versus [blog-posts.csv](examples/blog-posts.csv)

* [end-of-transmission-block.usv](examples/end-of-transmission-block.usv)


## Examples

USV with 2 units by 2 records by 2 groups by 2 files:

```usv
a␟b␟␞c␟d␟␞␝e␟f␟␞g␟h␟␞␝␜i␟j␟␞k␟l␟␞␝m␟n␟␞o␟p␟␞␝␜
```

Optional: if you prefer to see one record per line, then end each line with a USV escape:

```usv
a␟b␟␞␛
c␟d␟␞␛
␝␛
e␟f␟␞␛
g␟h␟␞␛
␝␛
␜␛
i␟j␟␞␛
k␟l␟␞␛
␝␛
m␟n␟␞␛
o␟p␟␞␛
␝␛
␜␛
```


## USV is easy and friendly

USV is intended to be easy to use and friendly to try.

USV works with many kinds of data, and many kinds of editors. Any editor that can render the USV characters will work. We use vi, emacs, helix, Zed, VS Code, JetBrains IDEs, Nova, TextMate, Sublime, Notepad++, etc.

USV works with many kinds of tools. Any tool that can parse the USV characters will work. We use awk, sed, grep, rg, miller, etc.

USV works with many kinds of languages. Any language that can handle UTF-8 character encoding and rendering should work. We use C, C++, C#, Elixir, Erlang, Go, Java, JavaScript, Julia, Kotlin, Perl, PHP, Python, R, Ruby, Rust, Swift, TypeScript, etc.

[Frequently asked questions](doc/faq/) and [criticisms](doc/criticisms/)


## Why use USV?

USV can handle data that contains commas, semicolons, quotes, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines (similar to CSV) and groups/tables/grids and files/schemas/folios (similar to ASV).

USV aims to be an international standard, and has a official IETF RFCXML Internet Draft submitted.

USV uses Unicode characters that are semantically meaningful.

USV works well with any typical modern editor, font, terminal, shell, search, and language.

USV uses visible letter-width characters, and these are easy to view, select, copy, paste, search.

[Frequently asked questions](doc/faq/)



## Legal protection for standardization

The USV project aims to become a free open source IETF standard and IANA standard, much like the standards for CSV and TDF.

Until the standardization happens, the terms "USV" and "Unicode Separated Values" are trademarks of this project, and this repository is copyright 2022-2024. When IETF and IANA approve the submissions as a standard, then the trademarks and copyrights become public domain.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>
