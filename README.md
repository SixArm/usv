# Unicode Separated Values (USV)

Unicode separated values (USV) is a text data format that uses Unicode symbol characters between data parts. 

USV is a text format that is similar to ASCII separated values (ASV), comma separated values (CSV), tab separated values (TSV), etc. USV is most like ASV plus Unicode visible symbols.

USV offers capabilities for spreadsheet collections such as multiple sheets and folios, database collections such as multiple tables and schemas, and UTF-8 encoding by default.

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

Liners:

* '\r' U+000D Carriage Return (CR)

* '\n' U+000A Line Feed (LF)


## Comparisons

| Capability                | [USV](./) | [CSV](doc/comparisons/csv) | [TSV](doc/comparisons/tsv) | [ASV](doc/comparisons/asv) |
| ------------------------- | --- | --- | --- | --- |
| Units / Cells / Fields    | ✅ | ✅ | ✅ | ✅ |
| Records / Lines / Rows    | ✅ | ✅ | ✅ | ✅ |
| Groups / Sheets / Tables  | ✅ | ⛔ | ⛔ | ✅ |
| Files / Folios / Schemas  | ✅ | ⛔ | ⛔ | ✅ |
| All visible separators    | ✅ | ✅ | 🟡 | ⛔ |
| Separator line spacing    | ✅ | 🟡 | 🟡 | ⛔ |
| IETF.org standards-track  | ✅ | 🟡 | 🟡 | ⛔ |
| End of Transmission Block | ✅ | ⛔ | ⛔ | ✅ |
| Unicode UTF-8 default     | ✅ | ⛔ | ⛔ | ⛔ |


USV semantics are for units, records, groups, files. 

* Spreadsheet equivalents are cells, lines, sheets, folios. 

* Databases equivalents are fields, rows, tables, schemas. 


## Hello World

This is the unit "hello" and the unit "world":

```usv
hello␟world␟
```

Liners can make the display prettier:

```usv
hello␟
world␟
```

USV can be parsed using e.g. the USV Rust crate:

```rust
use usv::*;
let input = "hello␟world␟";
let units = input.units().collect();
```


## Documentation

Documentation links:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Request For Comments (RFC)](doc/rfc/)

* [Code examples and production crates](doc/code/)
  
* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

* [TODO list](doc/todo/)

Character specifics:

* [Escape (ESC)](doc/escape/)

* [End of Transmission Block (ETB)](doc/end-of-transmission-block/)

* [Liners (CR|LF)](doc/liners/)

How to:

* [How to type Unicode characters](doc/how-to-type-unicode-characters/)

* [How to use split and regex](doc/how-to-use-split-and-regex)

Context help:

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons/)

* [Criticisms and replies](doc/criticisms/)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values/)

Editor notes:

* [vi notes](doc/editors/vi/)

* [emacs notes](doc/editors/emacs/)

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

With liners:

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

USV can be parsed using e.g. the USV Rust crate iterators:

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


## USV is easy and friendly

USV is intended to be easy to use and friendly to try.

USV works with many kinds of data, and many kinds of editors. Any editor that can render the USV characters will work. We use vi, emacs, helix, Zed, VS Code, JetBrains IDEs, Nova, TextMate, Sublime, Notepad++, etc.

USV works with many kinds of tools. Any tool that can parse the USV characters will work. We use awk, sed, grep, rg, miller, etc.

USV works with many kinds of languages. Any language that can handle UTF-8 character encoding and rendering should work. We use C, C++, C#, Elixir, Erlang, Go, Java, JavaScript, Julia, Kotlin, Perl, PHP, Python, R, Ruby, Rust, Swift, TypeScript, etc.


## Why use USV?

USV can handle data that contains commas, semicolons, quotes, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines (similar to CSV) and groups/tables/grids and files/schemas/folios (similar to ASV).

USV aims to be an international standard, and has a official IETF RFCXML Internet Draft submitted.

USV uses Unicode characters that are semantically meaningful.

USV works well with any typical modern editor, font, terminal, shell, search, and language.

USV uses visible letter-width characters, and these are easy to view, select, copy, paste, search.


## Legal protection for standardization

The USV project aims to become a free open source IETF standard and IANA standard, much like the standards for CSV and TDF.

Until the standardization happens, the terms "USV" and "Unicode Separated Values" are trademarks of this project, and this repository is copyright 2022-2024. When IETF and IANA approve the submissions as a standard, then the trademarks and copyrights will go to a free libre open source software advocacy foundation.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

[FAQ](doc/faq/) &bull; [RFC](doc/rfc/) &bull; [Code](doc/code/) &bull; [Comparisons](doc/comparisons/) &bull; [Criticisms](doc/criticisms/) &bull; [TODO](doc/todo/) &bull; [XKCD](https://xkcd.com/927/)
