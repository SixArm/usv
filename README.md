# Unicode Separated Values (USV)

Unicode Separated Values (USV) is a data format that uses Unicode characters to mark parts. 

USV builds on ASCII separated values (ASV) and contrasts with comma separated values (CSV).

USV offers pragmatic ways to edit data in text editors by using visual symbols and line breaks.

USV has capabilities for spreadsheet folios and sheets, databases schemas and tables, and more.

[FAQ](doc/faq/) &bull; 
[RFC](doc/rfc/) &bull; 
[Code](doc/code/) &bull; 
[Comparisons](doc/comparisons/) &bull; 
[Criticisms](doc/criticisms/) &bull; 
[TODO](doc/todo/) &bull; 
[XKCD](https://xkcd.com/927/)


## USV characters

Separators:

* Unit Separator (US) is U+001F or U+241F ␟

* Record Separator (RS) is U+001E or U+241E ␞

* Group Separator (GS) is U+001D or U+241D ␝

* File Separator (FS) is U+001C or U+241C ␜

Modifiers:

* Escape (ESC) is U+001B or U+241B ␛

* End of Transmission (EOT) is U+0004 or U+2404 ␄

Liners:

* Carriage Return (CR) is U+000D

* Line Feed (LF) is U+000A


## Hello World

The USV unit "hello" and USV unit "world" with USV symbols:

```usv
hello␟world␟
```

The USV unit "hello" and USV unit "world" with USV controls:

```usv
hello\u{001F}world\u{001F}
```


## Hello World for Comma Separated Values (CSV)

CSV example:

```xlsx
a,b
c,d
```

USV with symbols:

```usv
a␟b␟␞
c␟d␟␞
```

USV with controls:

```usv
a\u{001F}b\u{001F}\u{001E}
c\u{001F}d\u{001F}\u{001E}
```

## Hello World for Microsoft Excel (XLSX)

XLSX example:

```xlsx
Sheet 1
a,b
c,d

Sheet 2
d,e
f,g
```

USV with symbols:

```usv
Sheet 1␟␞
a␟b␟␞
c␟d␟␞
␝
Sheet 2␟␞
e␟f␟␞
g␟h␟␞
␝
```

USV with controls:

```usv
Sheet 1\u{001F}\u{001E}
a\u{001F}b\u{001F}\u{001E}
c\u{001F}d\u{001F}\u{001E}
\u{001D}
Sheet 2\u{001F}\u{001E}
e\u{001F}f\u{001F}\u{001E}
g\u{001F}h\u{001F}\u{001E}
\u{001D}
```

## Comparisons to text data formats

| Capability                | [USV](./) | [ASV](doc/comparisons/asv) | [CSV](doc/comparisons/csv)  |
| ------------------------- | --- | --- | --- |
| Units / Cells / Fields    | ✅ | ✅ | ✅ |
| Records / Lines / Rows    | ✅ | ✅ | ✅ |
| Groups / Sheets / Tables  | ✅ | ✅ | ⛔ |
| Files / Folios / Schemas  | ✅ | ✅ | ⛔ |
| Visible separators        | ✅ | ⛔ | ✅ |
| Separator line spacing    | ✅ | ⛔ | 🟡 |
| IETF.org standards-track  | ✅ | ⛔ | 🟡 |
| Unicode UTF-8 default     | ✅ | ⛔ | ⛔ |


## Comparisons to spreadsheets and databases

USV semantics are units, records, groups, files. 

Spreadsheet semantics are cells, lines, sheets, folios. 

Databases semantics are fields, rows, tables, schemas. 


## Documentation

Commentary:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Criticisms and replies](doc/criticisms/)

* [TODO list](doc/todo/)

Specification:

* [Request For Comments (RFC)](doc/rfc/)

* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

* [Code examples and production crates](doc/code/)

* [Command line argument parsing](doc/clap/)

Character details:

* [Escape (ESC)](doc/escape/)

* [End of Transmission (EOT)](doc/end-of-transmission/)

* [Liners (CR|LF)](doc/liners/)

Extras:

* [Style](doc/style/) with symbols, controls, braces

* [Layout](doc/layout/) with lines for units, records, groups, files

How to:

* [How to type Unicode characters](doc/how-to-type-unicode-characters/)

* [How to use split and regex](doc/how-to-use-split-and-regex/)

Context:

* [Converters for ASV, CSV, JSON, XLSX](doc/converters/)

* [Comparisons with ASV, CSV, TSV, RSV, JSON](doc/comparisons/)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values/)

Editor notes:

* [vim notes](doc/editors/vi/)

* [emacs notes](doc/editors/emacs/)

Example files:

* [hello-world.usv](examples/hello-world.usv) versus [hello-world.csv](examples/hello-world.csv)

* [zen-koans.usv](examples/zen-koans.usv) versus [zen-koans.csv](examples/zen-koans.csv)

* [blog-posts.usv](examples/blog-posts.usv) versus [blog-posts.csv](examples/blog-posts.csv)

* [end-of-transmission.usv](examples/end-of-transmission.usv)


## Examples

USV with 2 units by 2 records by 2 groups by 2 files, and the style as sheets:

```usv
a␟b␟␞
c␟d␟␞
␝
e␟f␟␞
g␟h␟␞
␝
␜
i␟j␟␞
k␟l␟␞
␝
m␟n␟␞
o␟p␟␞
␝
␜
```

Parsing example with the USV Rust crate and its iterators:

```rust
use usv::*;
let input = "a␟b␟␞c␟d␟␞␝e␟f␟␞g␟h␟␞␝␜i␟j␟␞k␟l␟␞␝m␟n␟␞o␟p␟␞␝␜";
for f in input.files() {
    for g in file.groups() {
        for r in group.records() {
            for u in r.units() {
                println!(&u);
            }
        }
    }
}
```


## Why use USV?

USV can handle data that contains commas, semicolons, quotes, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines and groups/tables/grids and files/schemas/folios.

USV aims to be an international standard, and has a official IETF RFCXML Internet Draft submitted.

USV uses Unicode characters that are semantically meaningful.

USV works well with any typical modern editor, font, terminal, shell, search, and language.

USV uses visible letter-width characters, and these are easy to view, select, copy, paste, search.


## USV is easy and friendly

USV is intended to be easy to use and friendly to try.

USV works with many kinds of data, and many kinds of editors. Any editor that can render the USV characters will work. We use vim, emacs, helix, Zed, VS Code, JEOTrains IDEs, Nova, TextMate, Sublime, Notepad++, etc.

USV works with many kinds of tools. Any tool that can parse the USV characters will work. We use awk, sed, grep, rg, miller, etc.

USV works with many kinds of languages. Any language that can handle UTF-8 character encoding and rendering should work. We use C, C++, C#, Elixir, Erlang, Go, Java, JavaScript, Julia, Kotlin, Perl, PHP, Python, R, Ruby, Rust, Swift, TypeScript, etc.


## Legal protection for standardization

The USV project aims to become a free open source IETF standard and IANA standard, much like the standards for CSV and TDF.

Until the standardization happens, the terms "USV" and "Unicode Separated Values" are trademarks of this project, and this repository is copyright 2022-2024. When IETF and IANA approve the submissions as a standard, then the trademarks and copyrights will go to a free libre open source software advocacy foundation.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

[FAQ](doc/faq/) &bull; 
[RFC](doc/rfc/) &bull; 
[Code](doc/code/) &bull; 
[Comparisons](doc/comparisons/) &bull; 
[Criticisms](doc/criticisms/) &bull; 
[TODO](doc/todo/) &bull; 
[XKCD](https://xkcd.com/927/)
