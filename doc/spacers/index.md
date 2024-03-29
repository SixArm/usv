# Spacers

Spacers are characters that have the Unicode Derived Core Property White_Space.

Examples:

* U+0020 Space (SP)

* U+0009 Tab (TAB) aka Horizontal Tab (HT)

* U+000A Line Feed (LF) aka New Line (NL) aka End Of Line (EOL)

* U+000D Carriage Return (CR)

USV supports spacers around content and markers, because this greatly helps typical display uses.


## Line Feed character

USV with no spacers looks like this:

```usv
a␟b␟␞c␟d␟␞
```

If you want to see each record on its own line, then you can use newline characters:

```usv
a␟b␟␞
c␟d␟␞
```

If you want to see each unit on its own line, then you can use newline characters:

```usv
a␟
b␟
␞
c␟
d␟
␞
```

If you want to see each token on its own line, then you can use newline characters:

```usv
a
␟
b
␟
␞
c
␟
d
␟
␞
```

## Space character

USV with no spacers looks like this:

```usv
a␟bbb␟ccccc␟
```

If you want to see a column with left alignment, then you can use newline characters and space characters:

```usv
a    ␟
bbb  ␟
ccccc␟
```

If you want to see a column with right alignment, then you can use newline characters and space characters:

```usv
    a␟
  bbb␟
ccccc␟
```

If you want to see a column with center alignment, then you can use newline characters and space characters:

```usv
  a  ␟
 bbb ␟
ccccc␟
```
