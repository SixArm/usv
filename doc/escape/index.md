# Escape (ESC)

The Escape (ESC) symbol flips the purpose of the subsequent character:

* Escape + USV special character: the character is treated as content.

* Escape + USV typical character: the character is ignored.

USV with a unit that contains an Escape + End of Transmission, which is treated as content:

```usv
a␛␄b␟
```

In the rare case that you happen to have a separator then content that starts with a carriage return or newline, then you must escape the carriage return or newline. This is because separators may be optionally be followed by any number of carriage returns and/or newlines, which is to help with visual display.
```
