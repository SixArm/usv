# Frequently Asked Questions

USV is led by Joel Parker Henderson (joel@joelparkerhenderson.com).

Constructive feedback is welcome.


## Is USV easy?

Yes. If you know about comma separated values (CSV), or tab separated values
(TSV), or ASCII separated values (ASV), or JavaScript Object Notation (JSON),
then you already know much about USV.


## IS USV a standard?

USV is aiming to become an IANA standard similar to <a
href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA
TSV</a>.


## Why choose USV over CSV or TSV?

You want your data content to be able to contain commas, or tabs, or newlines.

You want your data content to be able to use data groups, or database tables, or
spreadsheet grids.

You want your data format to be able to use data files, or database schemas, or
spreadsheet folios.

You want your data semantics to be able to use hierarchy levels, nesting, or
outlines.

You want a consistent compatible standard format, which CSV can't always
provide.

You want a consistent compatible standardized file name extension, which
CSV/TSV/TDF can't always provide.


## Why choose USV over ASV?

You want your data content to be friendlier for human reading and human editing.

USV provides typically-visible letter-width characters (such as Unicode 241F),
whereas ASV provides typically-invisible zero-width characters (such as ASCII
31).

It's true that some editors do render ASV characters using other visual
representations, such as using the corresponding USV visible characters;
however in practice we haven't found much support for this approach.


## Why choose USV over ASV for machine-only data?

For machine-only data, such as data that will never be used for human reading or
human editing, then USV or ASV are similar because both can handle units,
fields, groups, and files.


## What if I want special whitespace handling?

You could use USV plus your own code for special whitespace handling.

You could try other kinds of processing, such as serializers, deserializers,
before filters, after filters, and transformation functions.

You could leverage consider other whitespace adjustments, such as command line
interfaces tools (such as `sed`, `awk`, `mlr`), or programming language
functions and methods (such as as `trim`, `strip`, `chomp`).


## Why use control picture characters rather than the control characters themselves?

We tried using the control characters, and also tried configuring various editors to show the control characters by rendering the control picture characters.

First, we encountered many difficulties with editor configurations, attempting to make each editor treat the invisible zero-width characters by rendering with the visible letter-width characters.

Second, we encountered problems with copy/paste functionality, where it often didn't work because the editor implementations and terminal implementations copied visible letter-width characters, not the underlying invisible zero-width characters.

Third, users were unable to distinguish between the rendered control picture characters (e.g. the editor saw ASCII 31 and rendered Unicode Unit Separator) versus the control picture characters being in the data content (e.g. someone actually typed Unicode Unit Separator into the data content).
