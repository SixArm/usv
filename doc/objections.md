# Objections

Some people have objections to USV. Our intent is to answer all constructive objections here.


## USV uses control picture characters rather than the control characters themselves.

Yes. This is on purpose.

We tried using the control characters, and also tried configuring various editors to show the control characters by rendering the control picture characters.

First, we encountered many difficulties with editor configurations, attempting to make each editor treat the invisible zero-width characters by rendering with the visible letter-width characters.

Second, we encountered problems with copy/paste functionality, where it often didn't work because the editor implementations and terminal implementations copied visible letter-width characters, not the underlying invisible zero-width characters.

Third, users were unable to distinguish between the rendered control picture characters (e.g. the editor saw ASCII 31 and rendered Unicode Unit Separator) versus the control picture characters being in the data content (e.g. someone actually typed Unicode Unit Separator into the data content).
