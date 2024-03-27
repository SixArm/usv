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

* USV builds on ASCII Separated Values (ASV) and uses all the same control characters.
  
* USV contrasts with Comma Separated Values (CSV) because USV is more specific and powerful.

* USV is similar in spirit to Markdown because the purpose is easy freeform text editing.

* [More…](doc/comparisons/)


### USV example

USV looks like this for units and records:

```usv
a␟b␟␞
c␟d␟␞
```

USV looks like this for units, records, groups, files:

```usv
My Workbook␟␞␝
My Worksheet␟␞
a␟b␟␞
c␟d␟␞
␝␜
```

### USV purpose

USV has the purpose of helping people use data.

* Edit data: by using plain text and any typical text editor.

* Save data: by using collections for spreadsheets, databases, and more.

* Share data: by using an international standard and matching tools.


* [More](doc/purpose/)


### USV markup

USV uses Unicode characters for data markup.

* Unit Separator (US): for a spreadsheet cell, database field, etc.

* Record Separator (RS): for a spreadsheet line, database row, etc.

* Group Separator (GS): for a spreadsheet sheet, database table, etc.

* File Separator (FS): for a spreadsheet folio, database schema, etc.

* [More](doc/markup/)


### USV style

USV uses style options to display marks in various ways.

* Style Symbols: use visible symbol characters such as `␟`

* Style Controls: use invisible control characters such as `\u001F`

* Style Braces: use curly-braces with abbreviations such as: `{US}`
 
* [More](doc/style/)


### USV layout

USV uses layout options to format data in various ways: by item, or with single-space, double-space.

* Layout Default: format the data so it looks good on a typical terminal screen.

* Layout 0, 1, 2: format each mark with 0 or 1 or 2 surrounding spacers.

* Layout by Units, Records, Groups, Files: format a chunk to display on one line.
 
* [More](doc/layout/)


## Documentation

Core:

* [Markup with separators, modifiers, spacers](doc/markup/)

* [Style with symbols, controls, braces](doc/style/)

* [Layout with spacers for units, records, groups, files](doc/layout/)

Community:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Criticisms and replies](doc/criticisms/)

* [TODO list](doc/todo/)

Specification:

* [Request For Comments (RFC)](doc/rfc/)

* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

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
