# Augmented Backus–Naur Form (ABNF)

Augmented Backus–Naur Form (ABNF) grammar-- work in progress.


## Semantics

* usv = *files

* file = *groups

* group = *records

* record = *units

* unit = *content-characters


## Syntax

* usv = ( header-and-body / body ) '*' ; anything after the body is chaff

* header-and-body = 1*unit-run / 1*record-run / 1*group-run / 1*file-run

* body = *unit-run / *record-run / *group-run / *file-run

* file-run = *( file FS )

* group-run = *( group GS )

* record-run = *( record RS )

* unit-run = *( unit US )


## Character classes

* content-character = typical-character / ESC '*'

* typical-character = '*' - special-character

* special-character = US / RS / GS / FS / ESC / ETB

* escape-character = ESC ( special-character / typical-character )


## Unicode symbols

* US = U+241F Symbol for Unit Separator (US)

* RS = U+241E Symbol for Record Separator (RS)

* GS = U+241D Symbol for Group Separator (GS)

* FS = U+241C Symbol for File Separator (FS)

* ESC = U+241B Symbol for Escape (ESC)

* ETB = U+2417 Symbol for End of Transmission Block (ETB)
