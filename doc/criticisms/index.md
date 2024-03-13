# Criticisms

USV is led by Joel Parker Henderson (joel@joelparkerhenderson.com).

Constructive feedback is welcome. See also [frequently asked questions](../faq/).


- [Fundamentally wrong](#fundamentally-wrong)
- [XKCD one universal standard](#xkcd-one-universal-standard)
- [You cannot edit it](#you-cannot-edit-it)
- [No efficient storage](#no-efficient-storage)
- [There is no wide library support](#there-is-no-wide-library-support)
- [Not all data is representable](#not-all-data-is-representable)
- [Editors work with invisible characters](#editors-work-with-invisible-characters)
- [Doesn't work with Excel](#doesnt-work-with-excel)
- [Not trivially splittable](#not-trivially-splittable)
- [No need for an escape character](#no-need-for-an-escape-character)
- [Can't encode as a single byte](#cant-encode-as-a-single-byte)
- [Wrong implementations](#wrong-implementations)
- [Better off advocating for editor support](#better-off-advocating-for-editor-support)
- [Cleverness for cleverness’s sake](#cleverness-for-clevernesss-sake)
- [This is kinda stupid](#this-is-kinda-stupid)
- [Nobody needs USV, and nobody should use it.](#nobody-needs-usv-and-nobody-should-use-it)


## Fundamentally wrong

"Using Unicode graphic characters as metasyntactic escape characters is fundamentally wrong. Those Unicode characters are for displaying the symbols for Unit Separator, Record Separator, etc. and not for actually being separators! ASCII already has those! Included in Unicode!" 

If you like those, use those; I tried those first, and they didn't work well in practice, because they are invisible, and don't copy correctly in many of our tools.


## XKCD one universal standard

"This is like the [XKCD cartoon about one universal standard](https://xkcd.com/927/)."

Ha! That's funny. It turns out USV isn't trying to be one universal standard. CSV works really well for many use cases, and is well-supported everywhere, so keep using it where it works well.

USV aims just for use cases that CSV doesn't seem to handle well, such as text that contains paragraphs of natural language, or data that involves spreadsheet collections (e.g. folios comprising sheets comprising rows and columns) and database collections (e.g. schemas comprising tables comprising records and fields), or data that needs optional streaming capabilities (e.g. synchronous idle heartbeats, end of transmission block terminators).


## You cannot edit it

"You cannot edit it in regular editor, like csv/tsv/jsonlines."

I edit it in regular editors, every day. I use vi, emacs, VS Code, JetBrains IDEs, and more. I've also tried USV on many more editors, and so far it works 100% of the time. If you have a specific editor that doesn't seem to be working well with USV, can you please contact me?


## No efficient storage

"There is no efficient storage, like binary formats." 

USV is a text format, on purpose, because it's aiming to be human-readable and human-editable. USV storage goals are similar in magnitude to CSV. 

If you want efficient storage like a binary format, one way is to use compression on the text data. USV, CSV. and similar text formats can work well with compression, especially if the content has compression-friendly aspects such as repetitions, sequences, patterns, and so forth.


## There is no wide library support

"There is no wide library support."

Currently there's library support for Rust, which is my preferred programming language for systems work. See the [usv](https://crates.io/crates/usv) and also the command line converter tools [usv-to-csv](https://crates.io/crates/usv-to-csv) and [csv-to-usv](https://crates.io/crates/usv-to-csv).

If you want library support, I welcome help from anyone who wants to develop it. The Rust crate is relatively easy to understand, and should be portable to similar family languages such as C, C++, C#, Java, JavaScript, Python, Ruby, etc.


## Not all data is representable 

"Not all data is representable." 

I don't believe that to be true. USV aims to be able to represent all UTF-8 encoded text. USV provides an escape character, so you can escape any of the USV special characters as you wish. 

Can you provide an example of data that is not representable, or an explanation of what the data could be?


## Editors work with invisible characters

"We already have editors that can work with invisible characters. It’s not hard."

It turns out it is hard, in practice. I tried using invisible characters first, and found ongoing hard problems such as with copy/paste, search/replace, import/export, pattern matching, font display, and zero-width rendering.

In fact, the difficulties with invisible characters seems to be the reason CSV happened.


## Doesn't work with Excel

"The adoptability challenge remains here to be Excel support."

Yes you're right. USV is brand-new on the standards track in 2024. Excel support is a long-term goal. Submitting to the IETF is to help programs like Excel to start supporting it. 

If you have experience with writing Excel import/export capabilities, I welcome your help.


## Not trivially splittable

"I'd avoid most of the escaping they show, especially for line endings, and just make RS '\n' the record separator, or possibly RS '\n'*."

Yes I tried that, and it worked well when the data was grid-oriented, like a spreadsheet with rows and columns, but didn't work well when the data was unit-oriented (such as a list of numbers), or group-oriented (such as a collection of spreadsheet sheets or database tables), or file-oriented (such as a collection of spreadsheet folios or database schemas).

Broadly speaking, USV does not have a goal of naive split-based parsing.


## No need for an escape character

"I am not convinced about the need for an escape character."

I tried USV without an escape character for a year to get real-world feedback. The feedback was that the escape was needed, because otherwise there could be data that couldn't be represented without an extra out-of-band reformatting/rewriting step.


## Can't encode as a single byte

"ASCII Separated Values is better because it can encode each separator as a single byte."

If single byte encoding is very important, and you don't care about visible symbols, then yes ASCII Separated Values is better for you. USV doesn't have a goal of single byte separators.


## Wrong implementations

"My bet is that this will lead to implementations that wrongly treats "␞␛\n" (RS ESC \m) as the real record separator, the same way lots of "CSV" implementations just split on comma and LF."

I agree. I believe the best way to stop wrong implementations is before they happen. I believe the best paths are the [RFC](../rfc/)standardization with IETF, and free open source production-quality reference [code](../code/).


## Better off advocating for editor support

"Just because a glyph is "invisible" doesn't mean it has to actually be invisible. The symbols for the separators are hard to read, like you're pointing out, which means someone would eventually replace them with some other graphical display, in which case you were just as well off with the actual separators themselves. They would have been better off advocating for editor support for actual separator display."

You're correct. Programmers have been advocating for editor support for actual separator display since the 1980's ASCII Separated Values. That path hasn't succeeded. USV is a compromise for the present. 

If the future offers editor support as you describe, then it will be great to use that instead of USV, and in fact USV will have been very useful for getting people using group separators, file separators, escapes, end of transmission blocks, synchronous idle, and other ASV features that are more extensive than CSV.


## Cleverness for cleverness’s sake

"USV would have the disadvantage of using multi-byte characters as delimiters, so you have to decode the file in order to separate records. And you still can’t type the characters directly or be guaranteed to display them without font support. This honestly seems like cleverness for cleverness’s sake."

You're correct mostly on your technical points. To decode one record, you have to read that one record until you reach its record separator; in other words, you can't just use split on one byte value as you can with CSV. That said, you can decode one unit at a time, or one record at a time, or one group at a time, or one file at a time; you don't have to decode the whole file.

As for cleverness, it's not especially clever; it's just ASCII DSV plus visible symbols. The core ideas are all from the 1970's.


## This is kinda stupid

"I've long wanted a successor to CSV, but this is kinda stupid. People like CSVs because they look good, feel natural even in plaintext. This is the same reason that Markdown in successful. As for including commas in your data, it could just have been managed with a simple escape character like a \, for when there's actually a comma in your data. That's it."

If you want a successor to CSV, do you have suggestions for what you want? What I learned is that when you escape with a backslash, then you have to also provide for escaping a backslash, such as two in a row, and then it causes issues for use cases such as Windows paths, regular expressions, backslash as used in a typical backslash-t for tab or backslash-n for newline, and so on. This is why I prefer to use the escape character as U+241B Symbol for Escape (ESC).

More broadly, CSV handles units and records (such as one spreadsheet sheet), but not groups (such as multiple spreadsheet sheets) or files (such as multiple spreadsheet folios). USV handles all of these.


## Nobody needs USV, and nobody should use it.

"This is needlessly adding yet another standard to the mix. If you are in a position to choose what standard you use, just use:

* Whatever is best for the data model and/or languages you use. JSON is a common modern choice, suitable for most things.

* If you want something more tabular, closer to CSV (which is a valid choice for bulk data), use strict RFC 4180 compliant data.

* If you want to specify your own binary super-compact data, use ASN.1. I am also given to understand that Protobuf is a popular modern choice.

If you aren’t in a position to choose your standards, just do whatever you need to do to parse whatever junk you are given, and emit as standards-compliant data as possible as output.

* Again, RFC 4180 is a great way to standardize your own CSV output, as long as you stick to a subset which the receiving party can parse.

Nobody needs USV, and nobody should use it."

Thanks for your specific feedback and conclusion. :-)

For me, what's best for my data model is text (not binary), that handles many human languages using UTF-8 (not ASCII), that is easy to read and edit in many editors (not a specialized row-column editor), and works especially well with content that is paragraphs of natural language with commas, quotes, newlines, indentations, and the like.

For example I've tried binary formats (e.g. ASN.1, Protobuf), row-column tabular formats (e.g. CSV, TDF), web data formats (e.g. JSON, YAML), web markup formats (e.g. HTML, XML). 
