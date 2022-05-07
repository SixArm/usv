# Frequently Asked Questions


## Is USV easy?

Yes. If you know about comma separated values (CSV), or tab separated values
(TSV), or ASCII separated values (ASV), then you already know nearly everything
about USV.


## Is USVX easy?

Yes. It's USV plus extensions: whitespace trim, backspace escape, final newline.


## IS USV/USVX standard?

Yes as soon as possible.

USV and USVX are both aiming to standardize akin to <a
href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA
TSV</a>.

USV and USVX are both led by Joel Parker Henderson
(joel@joelparkerhenderson.com).

Constructive feedback about standardization is very welcome.


## Why choose USV/USVX over CSV or TSV?

You want your data content to be able to contain commas, or tabs, or newlines.

You want your data content to be able to use data groups, or database tables, or
spreadsheet grids.

You want your data format to be able to use data files, or database schemas, or
spreadsheet folios.

You want a consistent compatible standard format, which CSV can't always
provide.

You want a consistent compatible standardized file name extension, which
CSV/TSV/TDF can't always provide.


## Why choose USV/USVX over ASV?

You want your data content to be friendlier for human reading and human editing.

USV provides typically-visible letter-width characters (such as Unicode 241F),
whereas ASV provides typically-invisible zero-width characters (such as ASCII
31).

It's true that some editors do render ASV characters using other visual
respresentations, such as using the corresponding USV visible characters;
however in practice we haven't found much support for this approach.


## Why choose USV/USVX over ASV for machine-only data?

For machine-only data, such as data that will never be used for human reading or
human editing, then USV or ASV are similar because both can handle units,
fields, groups, and files.


## Does USV/USVX provide special character escaping?

USV no. USVX yes: a typical backslash escape protects any USV character.

This is a deliberate design decision that enables USV be simpler to use, faster
to parse, and clearer to standardize.

When we researched character escaping, we found that it solved some needs, yet
caused difficulties for other needs. We concluded that CSV escaping is very
important because commas are so frequent in real world English text. We
discovered that CSV escaping is inconsistent across CSV implementations.


## What if I want special character escaping but not USVX?

You could use USV plus your own code for special character escaping.

You could try other data formats, such as JSON, or XML, or SQL.

You could leverage other character encodings, such as Unicode backslash-u
encoding (such as "\u241F" for Unit Separator), or base 64 encoding (such as
"4pCf" for Unit Separator).


## Does USV/USVX provide special whitespace handling?

USV no. USVX yes: any whitespace can surround any USV character.

This is a deliberate design decision that enables USV be simpler to use, faster
to parse, and clearer to standardize.

When we researched whitespace handling, we found that it solved some needs, yet
caused difficulties for other needs. We concluded that whitespace handling can
be convenient, yet is not a must-have, and thus is excluded from the USV
standard. We concluded that whitespace handling is very useful for some proects,
and thus is included in the USVX standard.


## What if I want special whitespace handling but not USVX?

You could use USV plus your own code for special whitespace handling.

You could try other kinds of processing, such as serializers, deserializers,
before filters, after filters, and transformation functions.

You could leverage consider other whitepace adjustments, such as command line
intefaces tools (such as `sed`, `awk`, `mlr`), or programming language functions
and methods (such as as `trim`, `strip`, `chomp`).
