# Comparisons with CSV, TSV, TDF, ASV, DEL

Unicode separated values (USV) is similar to these formats, plus offers more capabilities, editor-friendly markup, and standards-track syntax.

* [Comma Separated Values (CSV)](csv)

* [Tab Separated Values (TSV) a.k.a. Tab Delimited Format (TDF)](tsv)

* [ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)](asv)

* [Rows of String Values (RSV)](rsv)

## Summary table

| Capability                | [USV](../../) | [CSV](csv) | [TSV](tsv) | [ASV](asv) | [RSV](rsv) |
| --------------------------| --- | --- | --- | --- | --- |
| Units / cells / fields    | ✅ | ✅ | ✅ | ✅ | ✅ |
| Records / lines / rows    | ✅ | ✅ | ✅ | ✅ | ✅ |
| Groups / sheets / tables  | ✅ | ⛔ | ⛔ | ✅ | ⛔ |
| Files / folios / schemas  | ✅ | ⛔ | ⛔ | ✅ | ⛔ |
| Text, not binary          | ✅ | ✅ | ✅ | ✅ | ⛔ |
| All visible separators    | ✅ | ✅ | 🟡 | ⛔ | ⛔ |
| Separators then *(CR/LF)  | ✅ | 🟡 | 🟡 | ⛔ | ⛔ |
| Escaping                  | ✅ | ✅ | ⛔ | ✅ | ⛔ |
| End of Transmission Block | ✅ | ⛔ | ⛔ | ✅ | ⛔ |
| Unicode UTF-8 default     | ✅ | ⛔ | ⛔ | ⛔ | ⛔ |
| Variable units per record | ✅ | ⛔ | ⛔ | ⛔ | ✅ |
