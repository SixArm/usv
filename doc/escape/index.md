# Escape (ESC)

The Escape (ESC) symbol makes the subsequent character treated as a content character.

Example: USV with a unit that contains an Escape + End of Transmission, which is treated as content.

```usv
a␛␄b␟
```

In the rare case that you need a separator then content that starts with a carriage return or newline:

* You escape the carriage return or newline.

* This is because separators may be optionally be followed by any number of carriage returns and/or newlines, which is to help with visual display.
