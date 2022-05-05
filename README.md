# Unicode Separated Values (USV)

Unicode separated values (USV) is a data format that places Unicode characters between data parts:

* ␟ = U+241F = US = Unit Separator. Use between each data unit, database column, spreadsheet cell, etc.

* ␞ = U+241E = RS = Record Separator. Use between each data record, database row, spreadsheet line, etc.

* ␝ = U+241D = GS = Group Separator. Use between each data group, database table, spreadsheet grid, etc.

* ␜ = U+241C = FS = File separator. Use between each data file, database schema, spreadsheet folio, etc.

If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know about USV.


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



## Frequently Asked Questions

<dl>

<dt>Is USV easy?</dt>

<dd>Yes. If you know about comma separated values (CSV), or tab separated values (TSV), or ASCII separated values (ASV), then you already know most everything about USV.</dd>

<dt>Is USV a standard?</dt>

<dd>Yes as soon as possible. USV is a standard proposal led by Joel Parker Henderson (joel@joelparkerhenderson.com), and aiming to standardize akin to [IANA TSV](https://www.iana.org/assignments/media-types/text/tab-separated-values).</dd>

<dt>Can USV use escaping so data can contain the special USV characters?</dt>

<dd>No. This deliberate decision of no-escaping helps USV be simpler to use, faster to parse, clearer to standardize, and closer in alignment with <a href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA TSV</a>.

<dt>Why choose USV over CSV or TSV?</dt>

<dd>Choose USV over CSV or TSV when you want your data content to be able to contain commas, or tabs, or newlines. Choose USV over CSV when you want a consistent compatible standardized format, and a consistent compatible standardized file name extension.</dd>

<dt>Why choose UTF over ASV?</dt>

<dd>When data are potentially for human reading or human editing, such as by a programmer, then USV provides visible letter-width characters (U+241E and U+241F) whereas ASV provides tinvisible zero-width characters (ASCII 30 and ASCII 31). Some editors do render ASV invisible characters using the corresponding USV visible characters; however, we haven't found much support for this approach.</dd>

<dt>Why choose UTF over ASF for machine-only data?</dt>

<dd>For machin-only data, such as data that never for human reading or human editing, then USV or ASV are similar because both can handle units, fields, groups, and files.

</dl>


## Pull requests for USV 

Open pull requests:

* Q: <https://github.com/harelba/q/issues/201>

* TextQL: https://github.com/dinedal/textql/issues/115

Completed pull requests:

* Miller: <https://github.com/johnkerl/miller/issues/245>


## Comparison to CSV, TSV and TDF, ASV and DEL

Unicode separated values (USV) is a data format similar in purpose to other formats.

<dl>

<dt>comma separated values (CSV)</dt>

<dd>CSV format uses a comma to separate values, and a newline to separate records. In our experience, the CSV format has various kinds of implementations, some incompatible, some with escaping and some without. In our experience, some software programs use the file name extension ".csv" to mean other ways of separating data with other characters, such as using tabs, or semi-colons, or spaces. CSV handles data units/columns/cells and data records/rows/lines, but does not handle data groups/tables/grids or data files/schemas/folios.</dd>

<dt>tab separated values (TSV) a.k.a. tab delimited format (TDF)</dt>

<dd>TSV format uses a tab to separate values, and a newline to separate records. In our experience, the TSV format can be difficult to edit with some editors, because the tab character can be invisible, or can take up a varying number of character widths such as the equivalent of 2 spaces, or 4 spaces, or 8 spaces, or as many spaces as it takes to get to the next tab stop. TSV handles data units/columns/cells and data records/rows/lines, but does not handle data groups/tables/grids or data files/schemas/folios.</dd>

<dt>ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)</dt>

<dd>ASV format uses ASCII character 28 as file separator, 29 as group separator, 30 as record separator, 31 as unit separator. ASV and USV both handle all the same data separations. In our experience, these ASCII characters tend to be hard to edit manually, because many editors treat the characters as invisible zero-width characters. USV uses the same semantics, yet with visible letter-width characters.</dd>

</dl>


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


## BNF pseudocode

unit_separator ::= U+241F

record_separator ::= U+241E

group_separator ::= U+241D

file_separator ::= U+241C

unit ::= [character]+  # All characters except the 4 separators

units ::= unit ( unit_separator unit ) *

record ::= [units]*

records ::= record ( record_separator record ) *

group ::= [records]*

groups ::= group ( group_separator group ) *

file ::= [groups]*

files ::= file ( file_separator file ) *

usv ::= units or records or groups or files


## History of ASCII separated values (ASV)

➤ <https://www.lammertbies.nl/comm/info/ascii-characters>

<dl>

<dt>ASCII 28 = FS = File separator</dt>

<dd>The file separator FS is an interesting control code, as it gives us insight in the way that computer technology was organized in the sixties. We are now used to random access media like RAM and magnetic disks, but when the ASCII standard was defined, most data was serial. I am not only talking about serial communications, but also about serial storage like punch cards, paper tape and magnetic tapes. In such a situation it is clearly efficient to have a single control code to signal the separation of two files. The FS was defined for this purpose.</dd>

<dt>ASCII 29 = GS = Group separator</dt>

<dd>Data storage was one of the main reasons for some control codes to get in the ASCII definition. Databases are most of the time setup with tables, containing records. All records in one table have the same type, but records of different tables can be different. The group separator GS is defined to separate tables in a serial data storage system. Note that the word table wasn't used at that moment and the ASCII people called it a group.</dd>

<dt>ASCII 30 = RS = Record separator</dt>

<dd>Within a group (or table) the records are separated with RS or record separator.</dd>

<dt>ASCII 31 = US = Unit separator</dt> 

<dd>The smallest data items to be stored in a database are called units in the ASCII definition. We would call them field now. The unit separator separates these fields in a serial data storage environment. Most current database implementations require that fields of most types have a fixed length. Enough space in the record is allocated to store the largest possible member of each field, even if this is not necessary in most cases. This costs a large amount of space in many situations. The US control code allows all fields to have a variable length. If data storage space is limited—as in the sixties—this is a good way to preserve valuable space. On the other hand is serial storage far less efficient than the table driven RAM and disk implementations of modern times. I can't imagine a situation where modern SQL databases are run with the data stored on paper tape or magnetic reels.</dd>


## Conclusion

USV is helping us with real-world data format projects, and we hope USV can be helpful to you too.

We welcome constructive feeback about USV, as well as git issues, pull requests, and standardization help.
