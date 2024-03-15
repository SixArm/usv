# Augmented Backus–Naur Form (ABNF)

Augmented Backus–Naur Form (ABNF) grammar-- work in progress.


## Semantics

* usv = *files

* file = *groups

* group = *records

* record = *units

* unit = *content-characters


## Syntax

Sections:

* usv = ( header-and-body / body ) '*' ; anything after the body is chaff

* header-and-body = 1*unit-run / 1*record-run / 1*group-run / 1*file-run

* body = *unit-run / *record-run / *group-run / *file-run

Runs:

* file-run = *( *liner-character file *liner-character FS )

* group-run = *( *liner-character group *liner-character GS )

* record-run = *( *liner-character record *liner-character RS )

* unit-run = *( *liner-character unit *liner-character US )

Character classes:

* content-character = typical-character / ESC '*'

* typical-character = '*' - special-character

* special-character = US / RS / GS / FS / ESC / EOT

* escape-character = ESC ( special-character / typical-character )

* liner-character = CR / LF


## Unicode characters

Separators:

* US = U+241F Symbol for Unit Separator (US)

* RS = U+241E Symbol for Record Separator (RS)

* GS = U+241D Symbol for Group Separator (GS)

* FS = U+241C Symbol for File Separator (FS)

Modifiers:

* ESC = U+241B Symbol for Escape (ESC)

* EOT = U+2404 Symbol for End of Transmission (EOT)

Liners:

* CR = U+000D Carriage Return (CR)

* LF = U+000A End of Line (EOL, LF, NL)
