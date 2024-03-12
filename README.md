# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that uses Unicode symbol characters between data parts. USV is similar in kind to comma separated values (CSV), tab separated values (TSV), ASCII separated values (ASV), and similar systems. USV offers more capabilities for Unicode characters, spreadsheet folios of sheets, database schemas of tables, streaming, and escaping.

The USV repo is <https://github.com/sixarm/usv>.

The USV file name extension is "usv" and media type is "text/usv".

[FAQ](doc/faq/) &bull; [RFC](doc/rfc/) &bull; [Comparisons](doc/comparisons/) &bull; [Criticisms](doc/criticisms/) &bull; [XKCD](https://xkcd.com/927/)


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

* These work well with spreadsheet cells, rows, sheets, and folios.

* These work well with database fields, records, tables, and schemas. 


## Documentation

Documentation links:

* [Frequently Asked Questions (FAQ)](doc/faq/)

* [Request For Comments (RFC)](doc/rfc/)

* [Augmented Backus–Naur Form (ABNF)](doc/anbf/)

* [TODO list](doc/todo/)

Context help:

* [Comparisons with CSV, TSV, TDF, ASV, DEL](doc/comparisons/)

* [Criticisms and replies](doc/criticisms/)

* [How to type Unicode characters](doc/how-to-type-unicode-characters/)

* [History of ASCII separated values (ASV)](history-of-ascii-separated-values/)

Commands to convert between formats:

* [usv-to-csv](https://crates.io/crates/usv-to-csv)

* [csv-to-usv](https://crates.io/crates/csv-to-usv)

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


## Escape (ESC)

The Escape (ESC) symbol flips the purpose of the subsequent character:

* Escape + USV special character: the character is treated as content.

* Escape + USV typical character: the character is ignored.

USV with a unit that contains an Escape + End of Transmission Block, which is treated as content:

```usv
a␛␗b␟
```

Escape + newline can be helpful for typical text editor line continuations:

```usv
a␟b␞␛
c␟d␞␛
```


## Synchronous Idle (SYN)

The Synchronous Idle (SYN) symbol is a heartbeat, and is especially useful for streaming data, such as to keep a connection alive.

* SYN tells the data reader that data streaming is still in progress.

* SYN has no effect on the output content.

Example of a unit that contains a Synchronous Idle:

```usv
a␖b␞
```


## End of Transmission Block (ETB)

The End of Transmission Block (ETB) symbol tells any reader that it can stop reading, and is especially useful for streaming data, such as to close a connection. ETB can also be useful for providing data files that contain USV data, then ETB, then extra non-USV information such as comments, images, attachments, etc.

* ETB tells the data reader that data streaming is done.

* ETB has no effect on the output content.

Example of a unit then an End of Transmission Block:

```usv
abc␞␗
```


## USV is easy and friendly

USV is intended to be easy to use and friendly to try.

USV works with many kinds of data, and many kinds of editors. Any editor that can render the USV characters will work. We use vi, emacs, Coda, Notepad++, TextMate, Sublime, VS Code, etc.

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


## USV source code

This repository includes example USV scripts with character parsing. 

Bash examples:

* [usv-to-display.bash](bin/bash/usv-to-display.bash)

* [usv-to-debug.bash](bin/bash/usv-to-debug.bash)

* [usv-to-csv.bash](bin/bash/usv-to-csv.bash)

Python examples:

* [usv-to-display.py](bin/python/usv-to-display.py)

* [usv-to-debug.py](bin/python/usv-to-debug.py)

* [usv-to-csv.py](bin/python/usv-to-csv.py)

Rust has a crate in its own repo suitable for production use:

* `cargo install usv`

* [https://crates.io/crate/usv](https://crates.io/crate/usv)

* [https://github.com/sixarm/usv-rust-crate](https://github.com/sixarm/usv-rust-crate) (GitHub repository)


## Legal protection for standardization

The USV project aims to become a free open source IETF standard and IANA standard, much like the standards for CSV and TDF.

Until the standardization happens, the terms "USV" and "Unicode Separated Values" are trademarks of this project, and this repository is copyright 2022-2024. When IETF and IANA approve the submissions as a standard, then the trademarks and copyrights become public domain.


## Conclusion

USV is helping us with data projects. We hope USV may help you too.

We welcome constructive feedback about USV, as well as git issues, pull requests, and standardization help.

<https://github.com/sixarm/usv>
