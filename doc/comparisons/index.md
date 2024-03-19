# Comparisons with ASV, CSV, TSV, RSV 

Unicode separated values (USV) is similar to these formats, plus offers more capabilities, editor-friendly markup, and standards-track syntax.

* [ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)](asv)

* [Comma Separated Values (CSV)](csv)

* [Tab Separated Values (TSV) a.k.a. Tab Delimited Format (TDF)](tsv)

* [Rows of String Values (RSV)](rsv)

* [JavaScript Object Notation (JSON)](json)


## Summary table

| Capability                | [USV](../../) | [ASV](asv) | [CSV](csv) | [TSV](tsv) | [RSV](rsv) | [JSON](json)
| --------------------------| --- | --- | --- | --- | --- |
| Units / cells / fields    | ✅ | ✅ | ✅ | ✅ | ✅ | 🟡 |
| Records / lines / rows    | ✅ | ✅ | ✅ | ✅ | ✅ | 🟡 |
| Groups / sheets / tables  | ✅ | ✅ | ⛔ | ⛔ | ⛔ | 🟡 |
| Files / folios / schemas  | ✅ | ✅ | ⛔ | ⛔ | ⛔ | 🟡 |
| Text, not binary          | ✅ | ✅ | ✅ | ✅ | ⛔ | ✅ |
| All visible separators    | ✅ | ⛔ | ✅ | 🟡 | ⛔ | ✅ |
| Easy for any text editor  | ✅ | ⛔ | ✅ | ✅ | ⛔ | ⛔ |
| Separator line spacing    | ✅ | ⛔ | 🟡 | 🟡 | ⛔ | 🟡 |
| IETF.org standards-track  | ✅ | ⛔ | 🟡 | 🟡 | ⛔ | ✅ |
| Escaping                  | ✅ | ✅ | ✅ | ⛔ | ⛔ | 🟡 |
| End of Transmission       | ✅ | ✅ | ⛔ | ⛔ | ⛔ | ⛔ |
| Unicode UTF-8 default     | ✅ | ⛔ | ⛔ | ⛔ | ⛔ | ✅ |
| Variable units per record | ✅ | ⛔ | ⛔ | ⛔ | ✅ | ✅ |
