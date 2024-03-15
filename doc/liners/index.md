# Liners (CR|LF)

Liners are defined as carriage return (CR) characters and/or linefeed (LF) characters, when they come at the start or end of any USV content. 

USV supports liners because this greatly helps typical display uses.

Content without liners:

```usv
a␟b␟c␟d␟␞e␟f␟g␟h␟␞
```

With liners to display one record per line:

```usv
a␟b␟c␟d␟␞
e␟f␟g␟h␟␞
```

With liners to display one unit per line:

```usv
a␟
b␟
c␟
d␟
␞
e␟
f␟
g␟
h␟
␞
```

With liners to display one token per line:

```usv
a
␟
b
␟
c
␟
d
␟
␞
e
␟
f
␟
g
␟
h
␟
␞
```
