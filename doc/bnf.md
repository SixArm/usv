# BNF pseudocode


## Separators

unit_separator ::= U+241F

record_separator ::= U+241E

group_separator ::= U+241D

file_separator ::= U+241C


## USV

unit ::= character *  # All characters except the separator characters

units ::= unit ( unit_separator unit ) *

record ::= units *

records ::= record ( record_separator record ) *

group ::= records *

groups ::= group ( group_separator group ) *

file ::= groups *

files ::= file ( file_separator file ) *

usv ::= units | records | groups | files


## USVX

space ::= [:space:]  # A space, tab, vertical tab, form feed, new line, or carriage return

unit ::= character *  # All characters except the separator characters; no leading/trailing spaces.

units ::= unit ( space* unit_separator space* unit ) *

record ::= units *

records ::= record ( space* record_separator space* record ) *

group ::= records *

groups ::= group ( space* group_separator space* group ) *

file ::= groups *

files ::= file ( space* file_separator space* file ) *

usvx ::= ( units or records or groups or files ) + newline
