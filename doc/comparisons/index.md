# Comparisons with ASV, CSV, TSV, RSV 

Unicode separated values (USV) is similar to these formats, plus offers more capabilities, editor-friendly markup, and standards-track syntax.

* [ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)](asv)

* [Comma Separated Values (CSV)](csv)

* [Tab Separated Values (TSV) a.k.a. Tab Delimited Format (TDF)](tsv)

* [Rows of String Values (RSV)](rsv)

* [JavaScript Object Notation (JSON)](json)

* [Microsoft Excel (XLSX)](xlsx)


## Summary table

| Capability                  | [USV](../../) | [ASV](asv) | [CSV](csv) | [TSV](tsv) | [RSV](rsv) | [JSON](json) | [XLSX](xlsx)
| ----------------------------| --- | --- | --- | --- | --- | --- |
| Units / cells / fields      | ✅ | ✅ | ✅ | ✅ | ✅ | 🟡 | ✅ |
| Records / lines / rows      | ✅ | ✅ | ✅ | ✅ | ✅ | 🟡 | ✅ |
| Groups / sheets / tables    | ✅ | ✅ | ⛔ | ⛔ | ⛔ | 🟡 | ✅ |
| Files / folios / schemas    | ✅ | ✅ | ⛔ | ⛔ | ⛔ | 🟡 | ✅ |
| Text, not binary            | ✅ | ✅ | ✅ | ✅ | ⛔ | ✅ | ⛔ |
| All visible separators      | ✅ | ⛔ | ✅ | 🟡 | ⛔ | ✅ | ⛔ |
| Easy for any text editor    | ✅ | ⛔ | ✅ | ✅ | ⛔ | ⛔ | ⛔ |
| Separator line spacing      | ✅ | ⛔ | 🟡 | 🟡 | ⛔ | 🟡 | ⛔ |
| IETF.org standards-track    | ✅ | ⛔ | 🟡 | 🟡 | ⛔ | ✅ | 🟡 |
| Escaping                    | ✅ | ✅ | ✅ | ⛔ | ⛔ | 🟡 | 🟡 |
| End of Transmission         | ✅ | ✅ | ⛔ | ⛔ | ⛔ | ⛔ | ⛔ |
| Variable units per record   | ✅ | ⛔ | ⛔ | ⛔ | ✅ | ✅ | ⛔ |
| Separators are terminators  | ✅ | ⛔ | ⛔ | ⛔ | ✅ | ⛔ | ⛔ |
| Unicode UTF-8 default       | ✅ | ⛔ | ⛔ | ⛔ | ⛔ | ✅ | 🟡 |


## Example for ASCII Separated Values (ASV)

```asv
a\u001FB\u001F\u001Ec\u001FD\u001F\u001E
```

USV with symbols:

```usv
a␟b␟␞c␟d␟␞
```

USV with controls is identical to ASV:

```usv
a\u001FB\u001F\u001Ec\u001FD\u001F\u001E
```


## Example for Comma Separated Values (CSV)

CSV example:

```xlsx
a,b
c,d
```

USV with symbols:

```usv
a␟b␟␞
c␟d␟␞
```

USV with controls:

```usv
a\u001FB\u001F\u001E
c\u001FD\u001F\u001E
```


## Example for Tab Separated Values (TSV)

TSV example:

```xlsx
a       b
c       d
```

USV with symbols:

```usv
a␟b␟␞
c␟d␟␞
```

USV with controls:

```usv
a\u001FB\u001F\u001E
c\u001FD\u001F\u001E
```


## Example for Rows of String Values (RSV)

RSV example:

```rsv
a\b255b\b255\b253c\b255d\b255\b253
```

USV with symbols:

```usv
a␟b␟␞
c␟d␟␞
```

USV with controls:

```usv
a\u001FB\u001F\u001E
c\u001FD\u001F\u001E
```


## Example for Microsoft Excel (XLSX)

XLSX example:

```xlsx
Sheet 1
a,b
c,d

Sheet 2
d,e
f,g
```

USV with symbols:

```usv
Sheet 1␟␞
a␟b␟␞
c␟d␟␞
␝
Sheet 2␟␞
e␟f␟␞
g␟h␟␞
␝
```

USV with controls:

```usv
Sheet 1\u001F\u001E
a\u001FB\u001F\u001E
c\u001FD\u001F\u001E
\u001D
Sheet 2\u001F\u001E
e\u001Ff\u001F\u001E
g\u001Fh\u001F\u001E
\u001D
```
