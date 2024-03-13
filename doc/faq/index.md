# Frequently Asked Questions

USV is led by Joel Parker Henderson (joel@joelparkerhenderson.com).

Constructive feedback is welcome. See also [criticisms](../criticisms/).

- [Is USV easy?](#is-usv-easy)
- [IS USV aiming to be a standard?](#is-usv-aiming-to-be-a-standard)
- [Why choose USV over CSV or TSV?](#why-choose-usv-over-csv-or-tsv)
- [Why choose USV over ASV?](#why-choose-usv-over-asv)
- [Why choose USV over ASV for machine-only data?](#why-choose-usv-over-asv-for-machine-only-data)
- [What if I want special whitespace handling?](#what-if-i-want-special-whitespace-handling)
- [Why use control picture characters rather than the control characters themselves?](#why-use-control-picture-characters-rather-than-the-control-characters-themselves)
- [Why are the symbols so small on my screen?](#why-are-the-symbols-so-small-on-my-screen)



## Is USV easy?

Yes. If you know about comma separated values (CSV), or tab separated values
(TSV), or ASCII separated values (ASV), or JavaScript Object Notation (JSON),
then you already know much about USV.


## IS USV aiming to be a standard?

Yes, USV is aiming to become an IETF standard similar to <a
href="https://www.ietf.org/rfc/rfc4180.txt">IETF RCF 4180 for CSV</a>.
We have submitted the first IETF Internet Draft.

Yes, USV is aiming to become an IANA standard similar to <a
href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA
TSV</a>. We have submitted the request for the "text/usv" media type.


## Why choose USV over CSV or TSV?

You want your data content to be able to contain commas, or tabs, or newlines,
without special escaping or different quoting rules than other data such as
numbers.

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

You want to use End of Transmission Block (ETB), so you can guarantee a reader
has read data until the end.


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


## Why are the symbols so small on my screen?

USV renders on your system by using your local font. If your local font has small Unicode symbols for specific characters, then you'll see these. On many systems we've tried, the characters render with the letters "US", "RS", "GS", "FS", etc. We are open to suggestions for fonts that work especially with with USV, and we are open to funding the creation of specialized fonts for these specific characters.

