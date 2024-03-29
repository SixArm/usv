# ASCII Separated Values (ASV) a.k.a. DEL (Delimited ASCII)

ASCII Separated Values (ASV) uses these invisible zero-width control character separators:

* ASCII character 28 as file separator

* ASCII character 29 as group separator

* ASCII character 30 as record separator

* ASCII character 31 as unit separator.

These separators are identical in concept as in USV.

ASV also:

* Forbids the ASCII control characters in content. In other words, there is no escaping.

* In practice, has many incompatible implementations and users that expect the record separator to be a newline character, because the implementations and users prefer to display the data on a screen.


## In our experience

In our experience, these ASCII characters tend to be hard to edit manually.

* Because many editors treat the characters as invisible zero-width characters.

* Because major character pickers show the visible character then insert the visible character, which is the corresponding USV Symbol.

In our experience, > 90% of the ASV files we discovered in our research used the character "\n" as the record delimiter, or the combination of characters "\r\n", rather than the correct character 30.
