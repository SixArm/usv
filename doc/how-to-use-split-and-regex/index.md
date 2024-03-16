# How to use split and regex

To use split and regex, rather than a specific USV parsing tool or library, then you have choices. 

This pseudocode is the current best approximation of USV using split and regex:

```regex
data = usv split on "[\u0004\u2404]" first

files = data split on "[\n\r]*(?<![\u001B\u241B])\u001C\u241C[\n\r]*"

groups = file split on "[\n\r]*(?<![\u001B\u241B])[\u001D\u241D]␝[\n\r]*"

records = group split on "[\n\r]*(?<![\u001B\u241B])[\u001E\u241E][\n\r]*"

units = unit split on "[\n\r]*(?<![\u001B\u241B])[\u001F\u241F][\n\r]*"
```

If your split and regex do not have capabilities for negative look, and you are certain that your data does not use any escape characters:

```regex
data = usv split on "[\u0004\u2404]" first

files = data split on "[\n\r]*\u001C\u241C][\n\r]*"

groups = file split on "[\n\r]*[\u001D\u241D][\n\r]*"

records = group split on "[\n\r]*[\u001E\u241E][\n\r]*"

units = unit split on "[\n\r]*[\u001F\u241F][\n\r]*"
```
