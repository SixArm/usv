# Criticisms

USV is led by Joel Parker Henderson (joel@joelparkerhenderson.com).

Constructive feedback is welcome. See also [frequently asked questions](../faq/).

- [XKCD one universal standard](#xkcd-one-universal-standard)
- [Fundamentally wrong](#fundamentally-wrong)
- [You cannot edit it](#you-cannot-edit-it)
- [No efficient storage](#no-efficient-storage)
- [There is no wide library support](#there-is-no-wide-library-support)
- [Not all data is representable](#not-all-data-is-representable)
- [Editors work with invisible characters](#editors-work-with-invisible-characters)
- [Doesn't work with Excel](#doesnt-work-with-excel)
- [Not trivially splittable](#not-trivially-splittable)
- [No need for an escape character](#no-need-for-an-escape-character)
- [Can't encode as a single byte](#cant-encode-as-a-single-byte)
- [Better off advocating for editor support](#better-off-advocating-for-editor-support)
- [Cleverness for cleverness’s sake](#cleverness-for-clevernesss-sake)
- [This is kinda stupid](#this-is-kinda-stupid)
- [Nobody needs USV, and nobody should use it.](#nobody-needs-usv-and-nobody-should-use-it)
- [Kill it with fire](#kill-it-with-fire)


## XKCD one universal standard

<blockquote>
"This is like the <a href=https://xkcd.com/927/>XKCD cartoon</a> about one universal standard."
</blockquote>

Ha! That's funny. It turns out USV isn't trying to be one universal standard. CSV works really well for many use cases, and is well-supported everywhere, so by all means keep using CSV where you want and where it works well.

USV aims just for use cases that CSV doesn't seem to handle well, such as text that contains paragraphs of natural language, or displays better with newlines between units, or data that involves spreadsheet collections (e.g. folios comprising sheets comprising rows and columns) and database collections (e.g. schemas comprising tables comprising records and fields), or data that needs an End of Transmission.


## Fundamentally wrong

<blockquote>
"Using Unicode graphic characters as metasyntactic escape characters is fundamentally wrong. Those Unicode characters are for displaying the symbols for Unit Separator, Record Separator, etc. and not for actually being separators! ASCII already has those! Included in Unicode!"
</blockquote>

USV accepts ASCII control characters and the corresponding Unicode symbol characters as equivalent.

If you prefer to use exclusively ASCII control characters, then do that. I tried that approach first, and the ASCII control characters didn't work well in practice for visual display and for text editors. This is because the ASCII control characters are rendered as invisible for many of the displays and editors I tried, and also didn't copy correctly in many of the tools.

Also, there are command-line tools for converting from ASCII Separated Values (ASV) to Unicode Separated Values (USV) and vice versa: [asv-to-usv](https://crates.io/crates/asv-to-usv), [usv-to-asv](https://crates.io/crates/asv-to-usv).


## You cannot edit it

<blockquote>
"You cannot edit it in regular editor, like csv/tsv/jsonlines."
</blockquote>

I edit it in regular editors, every day. I use vi, emacs, VS Code, JEOTrains IDEs, and more. I've also tried USV on many more editors, and so far it works 100% of the time. If you have a specific editor that doesn't seem to be working well with USV, can you please contact me?


## No efficient storage

<blockquote>
"There is no efficient storage, like binary formats."
</blockquote>

USV is a text format, on purpose, because it's aiming to be human-readable and human-editable. USV storage goals are similar in magnitude to CSV.

If you want efficient storage like a binary format, one way is to use compression on the text data. USV, CSV. and similar text formats can work well with compression, especially if the content has compression-friendly aspects such as repetitions, sequences, patterns, and so forth.


## There is no wide library support

<blockquote>
"There is no wide library support."
</blockquote>

Currently there's library support using the [USV Rust crate](https://crates.io/crates/usv) and there are command line [converters](../converters/).

I welcome help creating library support from anyone who wants to help. The Rust crate is relatively easy to understand, and should be portable to similar family languages such as C, C++, C#, Java, JavaScript, Python, Ruby, etc.


## Not all data is representable

<blockquote>
"Not all data is representable."
</blockquote>

Can you provide an example of data that is not representable, or an explanation of what the data could be?

USV aims for all data to be representable. Specifically, USV aims to be able to represent all UTF-8 encoded text. USV provides an escape character, so you can escape any of the USV special characters as you wish.


## Editors work with invisible characters

<blockquote>
"We already have editors that can work with invisible characters. It’s not hard."
</blockquote>

It turns out it is hard, in practice. I tried using invisible characters first, and found ongoing hard problems such as with copy/paste, search/replace, import/export, pattern matching, font display, and zero-width rendering.

In fact, the difficulties with invisible characters seems to be the reason the reason that programmers mostly abandoned ASCII Separated Values (ASV) in favor of Comma Separated Values (CSV). USV aims to build on ASV to add capabilities for visible characters and better visible displays.


## Doesn't work with Excel

<blockquote>
"The adoptability challenge remains here to be Excel support."
</blockquote>

Yes you're right. USV is brand-new on the standards track in 2024. Excel support is a long-term goal. Submitting to the IETF is to help programs like Excel to start supporting it.

If you have experience with writing Excel import/export capabilities, I welcome your help.


## Not trivially splittable

<blockquote>
"This format is not trivially splittable with a regular expression. I'd avoid most of the escaping they show, especially for line endings, and just make RS '\n' the record separator, or possibly RS '\n'*."
</blockquote>

See the documentation about [how to use split and regex](../how-to-use-split-and-regex/).

Broadly speaking, USV does not have a goal to be trivially splittable, because visual editing is much more important in practice, and because library parsing is more more reliable.

ASCII Separated Values (ASV) should be trivially splittable by using a unit separator byte character and record separator byte character. But it turns out that many ASV files in the wild actually change from using the record separator byte character to a newline character. Before you split, you need to know these choices.

Comma Separated Values (CSV) should be trivially splittable by using a comma byte character and newline byte character. But it turns out that many CSV files in the wild actually change from using the comma byte character to a semicolon byte character or a pipe character. And some CSV files use escaping such as for quotes, or commas that are embedded in content, or escaped newlines that are embedded in content. Before you split, you need to know these choices. It's easy if you handle all data yourself; it's not easy if you're working with many worldwide organizations.


## No need for an escape character

<blockquote>
"I am not convinced about the need for an escape character."
</blockquote>

I tried USV without an escape character for a year to get real-world feedback. The feedback was that the escape was needed, because otherwise there could be data that couldn't be represented without an extra out-of-band reformatting/rewriting step.


## Can't encode as a single byte

<blockquote>
"ASCII Separated Values is better because it can encode each separator as a single byte."
</blockquote>

If single byte encoding is very important, and you don't care about visible symbols, then yes ASCII Separated Values (ASV) is better for you. USV doesn't have a goal of single byte separators.

You can freely convert between ASV and USV and back again, if you like, by using these [converters](../converters/)


## Better off advocating for editor support

<blockquote>
"Just because a glyph is "invisible" doesn't mean it has to actually be invisible. The symbols for the separators are hard to read, like you're pointing out, which means someone would eventually replace them with some other graphical display, in which case you were just as well off with the actual separators themselves. They would have been better off advocating for editor support for actual separator display."
</blockquote>

Yes you're correct. Programmers have been advocating for editor support for actual separator display since the 1980's ASCII Separated Values.

So far, the advocating has not succeeded. USV is a compromise for the present.

If the future offers editor support as you describe, then it will be great to use that instead of USV, and in fact USV will have been very useful for getting people using group separators, file separators, escapes, End of Transmissions, and other ASV features that are more extensive than CSV.


## Cleverness for cleverness’s sake

<blockquote>
"USV would have the disadvantage of using multi-byte characters as delimiters, so you have to decode the file in order to separate records. And you still can’t type the characters directly or be guaranteed to display them without font support. This honestly seems like cleverness for cleverness’s sake."
</blockquote>

Yes you're correct directionally on your technical points. To decode one record, you have to read that one record until you reach its record separator; in other words, you can't just use split on one byte value as you can with CSV. That said, you can decode one unit at a time, or one record at a time, or one group at a time, or one file at a time; you don't have to decode the whole file.

As for cleverness, it's not especially clever. USV is essentially just ASCII Separated Values (ASV) plus visible symbols and some simple extras for escape, end of transmission, and spacers. The core ideas of ASV and USV are all from the 1970's.


## This is kinda stupid

<blockquote>
"I've long wanted a successor to CSV, but this is kinda stupid. People like CSVs because they look good, feel natural even in plaintext. This is the same reason that Markdown in successful. As for including commas in your data, it could just have been managed with a simple escape character like a \, for when there's actually a comma in your data. That's it."
</blockquote>

If you want a successor to CSV, do you have suggestions for what you want?

What I learned is that when you escape with a backslash, then you have to also provide for escaping a backslash, such as two in a row, and then it causes issues for use cases such as Windows paths, regular expressions, backslash as used in a typical backslash-t for tab or backslash-n for newline, and so on. This is why I prefer to use the escape character as U+241B Symbol for Escape (ESC).

More broadly, CSV handles units and records (such as one spreadsheet sheet), but not groups (such as multiple spreadsheet sheets) or files (such as multiple spreadsheet folios). USV handles all of these.


## Nobody needs USV, and nobody should use it.

<blockquote>
"This is needlessly adding yet another standard to the mix. If you are in a position to choose what standard you use, just use:

* Whatever is best for the data model and/or languages you use. JSON is a common modern choice, suitable for most things.

* If you want something more tabular, closer to CSV (which is a valid choice for bulk data), use strict RFC 4180 compliant data.

* If you want to specify your own binary super-compact data, use ASN.1. I am also given to understand that Protobuf is a popular modern choice.

If you aren’t in a position to choose your standards, just do whatever you need to do to parse whatever junk you are given, and emit as standards-compliant data as possible as output.

* Again, RFC 4180 is a great way to standardize your own CSV output, as long as you stick to a subset which the receiving party can parse.

Nobody needs USV, and nobody should use it."
</blockquote>

Thanks for your specific feedback and conclusion. :-)

For me, what's best for my data model is text (not binary), that handles many human languages using UTF-8 (not ASCII), that is easy to read and edit in many text editors (not a specialized row-column editor), and that works especially well with content that is paragraphs of natural language with commas, quotes, newlines, indentations, and the like. I also want capabilities for groups (such as spreadsheet sheets) and files (such as spreadsheet folios).

For comparison I've tried binary formats (e.g. ASN.1, Protobuf), row-column tabular formats (e.g. CSV, TDF), web data formats (e.g. JSON, YAML), web markup formats (e.g. HTML, XML). For me, USV is significantly easier to use, read, edit, and share.


## Kill it with fire

<blockquote>
"Y'know, I greatly dislike this. It's an actual emotional reaction. This should not be standardized. No one should use this. This is a bad idea and deserves to die in obscurity.

I'll tell you why, it's pretty simple. The characters this... thing is stealing, exist to represent invisible control sequences. That is their use. The fact that they can be mentioned by direct input is inevitable, but not to be encouraged.

I will be greatly disappointed if this is accepted as a standard. The fact that a USV file looks like a rendered ASV file is a show stopping bug, an anti-feature, an insult to life itself. Kill it with fire."
</blockquote>

That's great feedback! The previous time that I heard that kind of feedback, it was about emoji being terrible and how no one should use them. Luckily representations evolve. 😀
