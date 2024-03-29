# How to use split and regex

To use split and regex, rather than a specific USV parsing tool or library, then you have choices.

The pseudocode here is the current best approximation of USV using split and regex.

If you are certain that your data never uses any escape characters:

```regex
transmission = split input on "[\u0004\u2404]" first

files = split transmission on "[\u001C\u241C]"

groups = split file on "[\u001D\u241D]

records = split group on "[\u001E\u241E]"

units = split unit on "[\u001F\u241F]"

unit = trim(unit)
```

If your data may use any escape characters, and also if your split and regex offer capabilities for negative lookbehind:

```regex
transmission = split input on "[\u0004\u2404]" first

files = split transmission on "(?<![\u001B\u241B])\u001C\u241C"

groups = split file on "(?<![\u001B\u241B])[\u001D\u241D]␝"

records = split group on "(?<![\u001B\u241B])[\u001E\u241E]"

units = split unit on "(?<![\u001B\u241B])[\u001F\u241F]"

unit = trim(unit)
```
