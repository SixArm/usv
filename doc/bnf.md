# BNF pseudocode

unit_separator ::= U+241F

record_separator ::= U+241E

group_separator ::= U+241D

file_separator ::= U+241C

unit ::= [character]+  # All characters except the 4 separators

units ::= unit ( unit_separator unit ) *

record ::= [units]*

records ::= record ( record_separator record ) *

group ::= [records]*

groups ::= group ( group_separator group ) *

file ::= [groups]*

files ::= file ( file_separator file ) *

usv ::= units or records or groups or files
