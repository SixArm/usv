# Spacers (CR|LF)

Spacers are defined as carriage return (CR) characters and/or linefeed (LF) characters, when they come at the start or end of any USV content. 

USV supports spacers because this greatly helps typical display uses.

With no spacers:

```usv
a␟b␟c␟d␟␞
```

With spacers to display each record on its own line:

```usv
a␟b␟␞
c␟d␟␞
```

With spacers to display each unit on its own line:

```usv
a␟
b␟
␞
c␟
d␟
␞
```

With spacers to display each token on its own line:

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
```
