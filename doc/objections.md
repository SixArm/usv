# Objections

Some people have objections to USV. Our intent is to answer all constructive objections here.


## There is no key on my keyboard for US or RS or GS or FS

On many systems, you can type Unicode characters by using the Alt key.

US: press and hold Alt, type +241f, then release Alt.

RS: press and hold Alt, type +241e, then release Alt.

GS: press and hold Alt, type +241d, then release Alt.

FS: press and hold Alt, type +241c, then release Alt.


## USV uses control picture characters rather than the control characters themselves.

Yes. This is on purpose.

We tried using the control characters, and also tried configuring various editors to show the control characters by rendering the control picture characters.

First, we encountered many difficulties with editor configurations, attempting to make each editor treat the invisible zero-width characters by rendering with the visible letter-width characters. 

Second, we encountered problems with copy/paste functionality, where it often didn't work because the editor implementations and terminal implementations copied visible letter-width characters, not the underlying invisible zero-width characters.

Third, users were unable to distinguish between the rendered control picture characters (e.g. the editor saw ASCII 31 and rendered Unicode Unit Separator) versus the control picture characters being in the data content (e.g. someone actually typed Unicode Unit Separator into the data content).


## USV doesn't handle including Control Picture characters in data content.

Yes. This is on purpose.

Suppose you have a set of blog articles, and some of the articles talk about USV, and use the picture characters. You cannot export this using solely USV, because USV aims to be as simple as possible, and data content is prohibited from including USV characters.

We tried many hundreds of real world data sets, and we also experimented with data content such as blog posts that contain USV characters.

We found that in all cases, there are three good approaches.

First, consider using the USVX data format, which is USV plus extended functionality that includes escaping USV characters by using a backslash.

Second, consider a data format other than USV. For example, consider using ASV because it provides similar capabilties for unit/column/cell, record/row/line, group/table/grid, file/schema/folio. For example, consider CSV with escaping. For example, consider more-sophisticated formats JSON, or XML, or binary formats. 

Third, consider a two-step data format, where the data content is encoded to protect it, then exported using USV. For example, typical HTML blog posts tend to encode some characters such as angle brackets and ampersands, and can encode arbitrary Unicode characters.

