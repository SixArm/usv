# Unicode Separated Values (USV) ™

Unicode Separated Values (USV) ™ is a data format that uses Unicode characters for markup.

[FAQ](doc/faq/) &bull;
[RFC](doc/rfc/) &bull;
[Code](doc/code/) &bull;
[Comparisons](doc/comparisons/) &bull;
[TODO](doc/todo/) &bull;
[XKCD](https://xkcd.com/927/)


## Introduction

Unicode Separated Values (USV) enables new ways of working with data as plain text.

* USV builds on ASCII Separated Values (ASV) plus adds capabilities for visible markup.

* USV contrasts with Comma Separated Values (CSV) because USV is more specific and powerful.

* USV is similar in spirit to Markdown (MD) because the purpose is easy freeform text editing.


### USV markup

USV uses Unicode characters for data markup.

* <tt>[U+001F](https://codepoints.net/U+001F)/[U+241F](https://codepoints.net/U+241F)</tt> Unit Separator.

* <tt>[U+001E](https://codepoints.net/U+001E)/[U+241E](https://codepoints.net/U+241E)</tt> Record Separator.

* <tt>[U+001D](https://codepoints.net/U+001D)/[U+241D](https://codepoints.net/U+241D)</tt> Group Separator.

* <tt>[U+001C](https://codepoints.net/U+001C)/[U+241C](https://codepoints.net/U+241C)</tt> File Separator.

* <tt>[U+001B](https://codepoints.net/U+001B)/[U+241B](https://codepoints.net/U+241B)</tt> Escape.

* <tt>[U+0004](https://codepoints.net/U+0004)/[U+2404](https://codepoints.net/U+2404)</tt> End of Transmission.

### USV examples

USV looks like this for a 1-dimensional data made of units, such as a log. Each unit ends with a Unit Separator character and an optional newline character.

```usv
a␟
b␟
c␟
d␟
```

USV looks like this for 2-dimensional data made of units and records, such as a spreadsheet table. Each record ends with a Record Separator character and an optional newline character.

```usv
a␟b␟␞
c␟d␟␞
```

USV looks like this for 3-dimensional data made of units and records and groups, such as a spreadsheet folio. Each group ends with a Group Separator character and an optional newline character.


```usv
Sheet1␟␞
a␟b␟␞
c␟d␟␞
␝
Sheet2␟␞
e␟f␟␞
g␟h␟␞
␝
```

USV looks like this for 4-dimensional data made of units and records and groups and files, such as a collection of spreadsheet folios. Each file ends with a File Separator character and an optional newline character.


```usv
Folio1␟␞
Sheet1␟␞
a␟b␟␞
c␟d␟␞
␝
Sheet2␟␞
e␟f␟␞
g␟h␟␞
␝␜
Folio2␟␞
Sheet3␟␞
a␟b␟␞
c␟d␟␞
␝
Sheet4␟␞
e␟f␟␞
g␟h␟␞
␝␜
```


### USV style

USV uses style options to display marks in various ways.

* Style Symbols: use visible symbol characters such as `␟`

* Style Controls: use invisible control characters such as `\u001F`

* Style Braces: use curly-braces with abbreviations such as: `{US}`


### USV layout

USV uses layout options to format data in various ways.

* Layout Default: format the data so it looks good on a typical terminal screen.

* Layout Lines: format each mark with 0 or 1 or 2 surrounding newlines.

* Layout by Units or Records or Groups or Files: format a chunk to display on one line.


## Documentation

Core:

* [Markup with separators and modifiers](doc/markup/)

* [Style with symbols, controls, braces](doc/style/)

* [Layout with units, records, groups, files, spacers](doc/layout/)

Community:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Criticisms and replies](doc/criticisms/)

* [TODO list](doc/todo/)

Specification:

* [Request For Comments (RFC)](doc/rfc/)

* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

Code:

* [Code examples and production crates](doc/code/)

* [Command line argument parsing](doc/clap/)

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


## Hello World

Suppose you want USV text with two units: "hello" and "world".

The USV text with USV symbol characters for unit separators:

```usv
hello␟world␟
```

The USV text with USV control characters for unit separators:

```usv
hello\u001Fworld\u001F
```


## Comparisons to spreadsheets and databases

USV semantics are units, records, groups, files.

Spreadsheet semantics are cells, lines, sheets, folios.

Databases semantics are fields, rows, tables, schemas.


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
let text = "a␟b␟␞c␟d␟␞␝e␟f␟␞g␟h␟␞␝␜i␟j␟␞k␟l␟␞␝m␟n␟␞o␟p␟␞␝␜";
let files = text.files();
for file in files {
    for group in file {
        for record in group {
            for unit in record {
                println!(&unit);
            }
        }
    }
}
```


## Why use USV?

USV can handle data that contains commas, semicolons, quotes, tabs, newlines, and other special characters, all without escaping.

USV can format units/columns/cells and records/rows/lines and groups/tables/grids and files/schemas/folios.

USV aims to be an international standard, and has an official IETF RFCXML Internet Draft.

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

Until the standardization happens, the terms "Unicode Separated Values" and "USV" are both trademarks of this project. This repository is copyright 2022-2024. The trademarks and copyrights are by Joel Parker Henderson, me, an individual, not a company.

When IETF and IANA approve the submissions as a standard, then the trademarks and copyright will go to a free libre open source software advocacy foundation. We welcome advice about how to do this well.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

[FAQ](doc/faq/) &bull;
[RFC](doc/rfc/) &bull;
[Code](doc/code/) &bull;
[Comparisons](doc/comparisons/) &bull;
[TODO](doc/todo/) &bull;
[XKCD](https://xkcd.com/927/)
