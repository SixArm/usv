# Comparisons with CSV, TSV, TDF, ASV, DEL

Unicode separated values (USV) is similar to these formats, plus offers more capabilities, editor-friendly markup, and standards-track syntax.


## comma separated values (CSV)

CSV format uses a comma to separate values, and a newline to separate records.

CSV handles data units/columns/cells and data records/rows/lines, but does not intend to handle data groups/tables/grids or data files/schemas/folios.

In our experience, the CSV format has various kinds of implementations, some incompatible, some with escaping and some without.

In our experience, some software programs use the file name extension ".csv" to mean other ways of separating data with other characters, such as using tabs, or semi-colons, or spaces.


### Commas

USV honors commas:

```usv
hello, world
```

CSV implementations may fail, or may need quoting:

```csv
"hello, world"
```


### Quotes

USV honors quotes:

```usv
I say "hello, world"
```

CSV implementations may fail, or may require a double double-quotes or a triple double-quotes:

```csv
"I say ""hello, world"""
```


### Newlines

USV honors newlines:

```usv
first line
second line
```

CSV implementations may need quoting and escaping:

```csv
"\"first line\rsecond line\""
```


## tab separated values (TSV) a.k.a. tab delimited format (TDF)

TSV format uses a tab to separate values, and a newline to separate records.

TSV handles data units/columns/cells and data records/rows/lines, but does not intend to handle data groups/tables/grids or data files/schemas/folios.</dd>

In our experience, the TSV format can be difficult to edit with some editors, because the tab character can be invisible, or can take up a varying number of character widths such as 4 spaces or 8 spaces, or as many spaces as it takes to get to the next tab stop.

In our experience, some software programs use the file name extension ".tsv", others use the extension ".tdf", and others use the extension ".csv" even though the file actually uses tabs and doesn't use commas.


## ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)

ASV format uses ASCII character 28 as file separator, 29 as group separator, 30 as record separator, 31 as unit separator.

ASV handles the same data separator concepts: file, group, record, unit.

In our experience, these ASCII characters tend to be hard to edit manually, because many editors treat the characters as invisible zero-width characters. USV uses the same semantics, yet with visible letter-width characters.
