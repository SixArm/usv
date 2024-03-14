# Comma Separated Values (CSV)

Comma Separated Values (CSV) uses a comma character to separate values, and a newline character to separate records.

* Has fields, which are equivalent to USV units.
  
* Has records, which are equivalent to USV records.
  
* Does not have a greater hierarchy, such as USV groups and fields, or spreadsheet sheets and folios, or database tables or schemas, etc.

* Forbids the tab character in content.

* Forbids the newline character in content.

* Some implementations forbid the comma character in content; other implementations allow it if and only if the field is surrounded by quotation marks.

* Some implementations forbid the newline character in content; other implementations allow it if and only if the field is surrounded by quotation marks.


## Custom delimiter character

Some CSV implementations and users enable a custom delimiter character.
 
* For example, some users prefer to use the semicolon character. This is prevalent among some European regions, where the comma character is frequently in use within numbers as a digit separator, such as "123,456,789".
  
* For example, some users prefer to use the vertical pipe character. This is prevalent among some developers of natural language content, when the developers are aware that content may contain commas or semicolons, yet is unlikely to contain a pipe character.

There is no standardization to know what the delimiter character is, ahead of time.
  
* In practice, some CSV implementations use a heuristic to guess the delimiter character by inspecting the data.

* In practice, some CSV users send along out-of-band instructions that explain the delimiter character.


### Commas

CSV implementations may fail when there is a comma that is supposed to be in content, or may require quoting:

This data is typically parsed as two CSV fields:

```csv
hello, world
```

To get the data as one field, some CSV implementations support surrounding quotation marks:

```csv
"hello, world"
```

USV honors commas, such as in this one unit that contains a comma:

```usv
hello, world
```


### Quotes

CSV implementations may fail when there is a quotation mark that is supposed to be in content, or may require implementation-specific triple double-quotes.

This data is typically parsed as a CSV error:

```csv
I say "hello, world"
```

To get the data as one field, some CSV implementations support surrounding quotation marks and escaping via double double-quotes:

```csv
"I say ""hello, world"""
```

USV honors quotes, such as in this one unit that contains quotation marks:

```usv
I say "hello, world"
```


### Newlines

CSV implementations may fail when there is a newline that is supposed to be in content, or may require implementation-specific escaping.

This data is typically parsed as a CSV error:

```csv
"first line\nsecond line"
```

To get the data as one field, some CSV implementations support escaping by using backslash quotation marks like this:

```csv
"\"first line\rsecond line\""
```

USV honors newlines, such as in this one unit that contains a newline:

```usv
first line
second line
```


## In our experience

In our experience, the CSV format has various kinds of implementations, some incompatible, some with escaping and some without.

In our experience, some software programs use the file name extension ".csv" to mean other ways of separating data with other characters, such as using tabs, or semi-colons, or spaces.
