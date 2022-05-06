# Frequently Asked Questions


## Is USV easy?

Yes. If you know about comma separated values (CSV), or tab separated values
(TSV), or ASCII separated values (ASV), then you already know nearly everything
about USV.


## Is USV a standard?

Yes as soon as possible.

USV is aiming to standardize akin to <a
href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA
TSV</a>.

USV standardization is led by Joel Parker Henderson
(joel@joelparkerhenderson.com). Constructive feedback is welcome.


## Why choose USV over CSV or TSV?

You want your data content to be able to contain commas, or tabs, or newlines. 

You want your data content to be able to use  data groups, or database tables,
or spreadsheet grids. 

You want your data format to be able to use data files, or database schemas, or
spreadsheet folios. 

You want a consistent compatible standardard format, which CSV can't always
provide.

You want a consistent compatible standardized file name extension, which
CSV/TSV/TDF can't always provide.


## Why choose UTF over ASV?

You want your data content to be friendlier for human reading and human editing. 

USV provides typically-visible letter-width characters (such as Unicode 241F),
whereas ASV provides typically-invisible zero-width characters (such as ASCII
31).

It's true that some editors do render ASV characters using other visual
respresentations, such as using the corresponding USV visible characters;
however in practice we haven't found much support for this approach.


## Why choose UTF over ASV for machine-only data?

For machine-only data, such as data that will never be used for human reading or
human editing, then USV or ASV are similar because both can handle units,
fields, groups, and files.


## Can USV have special character escaping?

No. This is a deliberate decision. There is no special treatment of escaping,
such as backslashes, ampersands, quotes, doubled-characters, etc. 

This decision enables USV be simpler to use, faster to parse, and clearer to
standardize. 

When we researched character escaping, we found that it solved some needs, yet
caused difficulties for other needs. We concluded that CSV escaping is very
important because commas are so frequent in real world English text. The USV
doesn't have this same frequent need.


## What if I really want special character escaping?

Some people really want special character escaping. For example, suppose you
have data content that contains USV characters. 

For these kinds of goals, you may want to use a different format with more power
(such as JSON or XML), or you may want to create your own non-USV internal
encoding akin to HTML ampersand encoding (such as "&us;" meaning unit separator)
or Unicode backslash-u encoding (such as "\u241F").


## Does USV have special whitespace handling?

No. This is a deliberate decision. There is no special treatment of whitepace,
such as spaces, tabs, newlines, etc.

This decision enables USV be simpler to use, faster to parse, and clearer to
standardize. 

When we researched whitespace handling, we found that it solved some needs, yet
caused difficulties for other needs. We concluded that whitespace handling can
be convenient, yet is not a must-have, and thus must be ommitted from the USV
standard.


## What if I really want special whitespace handling?

Some people really want special whitespace handling. For example, suppose you
want surrounding whitespace, such for a newline before the USV character and/or
a newline after the USV character. 

For these kinds of goals, you can use USV as usual, then afterwards add your own
whitepace handling, such as calling a function `trim` or `strip` or `chomp`.
