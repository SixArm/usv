# Augmented Backus–Naur form (ABNF)

https://en.wikipedia.org/wiki/Augmented_Backus%E2%80%93Naur_form

This page is a work in progress. Constructive feedback welcome.


## Unicode symbols

US = U+241F Symbol for Unit Separator (US)

RS = U+241E Symbol for Record Separator (RS)

GS = U+241D Symbol for Group Separator (GS)

FS = U+241C Symbol for File Separator (FS)

ESC = U+241B Symbol for Escape (ESC)

ETB = U+2417 Symbol for End of Transmission Block (ETB)


## USV characters

special-character = US / RS / GS / FS / ESC / ETB

typical-character = '*' - special-character

content-character = typical-character / ESC special-character


## USV basics

usv = \A ( *file-run / *group-run / *record-run / *unit-run ) *ETB *'*' \Z

file_run = *( file FS ) file *FS ; ; can be closed by ( FS / ETB )

group_run = *( group GS ) group *GS ; can be closed by ( GS / FS / ETB )

record_run = *( record RS ) record *RS ; can be closed by ( RS / GS / FS / ETB )

unit_run = *( unit US ) unit *US ; can be closed by ( US / RS / GS / FS / ETB )

file = group_run

group = record_run

record = unit_run

unit = *content-character


## USV work in progress

data = [header] [body] *ETB *'*'

header = [ unit_run / record_run / group_run / file_run ]

body = *( unit_run / record_run / group_run / file_run )
