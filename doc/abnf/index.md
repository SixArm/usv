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

* file-run = *( *spacer-character file *spacer-character FS )

* group-run = *( *spacer-character group *spacer-character GS )

* record-run = *( *spacer-character record *spacer-character RS )

* unit-run = *( *spacer-character unit *spacer-character US )

Character classes:

* content-character = typical-character / escape-character

* typical-character = '*' - special-character - escape-character

* special-character = US / RS / GS / FS / ESC / EOT

* escape-character = ESC ( special-character / typical-character )

* spacer-character = Defined by Unicode Derived Core Property White_Space


## Unicode characters

Markers:

* US = U+001F Unit Separator / U+241F Symbol for Unit Separator

* RS = U+001E Record Separator / U+241E Symbol for Record Separator

* GS = U+001D Group Separator / U+241D Symbol for Group Separator

* FS = U+001C File Separator / U+241C Symbol for File Separator

Modifiers:

* ESC = U+001B Escape / U+241B Symbol for Escape

* EOT = U+0004 End Of Transmission / U+2404 Symbol for End Of Transmission
