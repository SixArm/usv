# Escape (ESC)

The Escape (ESC) symbol flips the purpose of the subsequent character:

* Escape + USV special character: the character is treated as content.

* Escape + USV typical character: the character is ignored.

USV with a unit that contains an Escape + End of Transmission Block, which is treated as content:

```usv
a␛␗b␟
```

Escape + newline can be helpful for typical text editor line continuations:

```usv
a␟b␞␛
c␟d␞␛
```
