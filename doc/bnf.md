# BNF pseudocode

This page is a work in progress. Constructive feedback welcome.


## Unicode

unicode_symbol_for_unit_separator ::= U+241F

unicode_symbol_for_record_separator ::= U+241E

unicode_symbol_for_group_separator ::= U+241D

unicode_symbol_for_file_separator ::= U+241C

unicode_symbol_for_escape ::= U+241C

unicode_space ::= U+0020

unicode_horizonal_tab ::= U+0009

unicode_vertical_tab ::= U+0011

unicode_linefeed ::= U+0010  

unicode_carriage_return ::= U+0013


## USV

This section is intended to convey the concept of USV. 

* TODO: improve formal syntax.

* TODO: add typical character escaping.

all ::= *

unit_separator ::= unicode_unit_separator

record_separator ::= unicode_record_separator

group_separator ::= unicode_group_separator

file_separator ::= unicode_file_separator

separator ::= [
    unicode_symbol_for_unit_separator
    unicode_symbol_for_record_separator
    unicode_symbol_for_group_separator
    unicode_symbol_for_file_separator
]

escape ::= [
    unicode_symbol_for_escape
]

content := ( all - separator - escape ) ∪ ( escape all )  # Content character is any typical character UNION any escaped character

unit := content*

units ::= unit ( unit_separator unit )*  # Any number of unit items, each separated by a separator

record ::= units*

records ::= record ( record_separator record )*

group ::= records*

groups ::= group ( group_separator group )*

file ::= groups*

files ::= file ( file_separator file )*

usv ::= \A ( units | records | groups | files ) \Z


## USVX

This section is intended to convey the concept of USV. 

* TODO: improve formal syntax.

* TODO: add typical character escaping.

all ::= *

unit_separator ::= space* unicode_unit_separator space*

record_separator ::= space* unicode_record_separator space*

group_separator ::= space* unicode_group_separator space*

file_separator ::= space* unicode_file_separator space*

separator ::= [
    unit_separator
    record_separator
    group_separator
    file_separator
]

space ::= [
    unicode_space
    unicode_horizonal_tab
    unicode_vertical_tab
    unicdoe_linefeed
    unicode_carriage_return 
]

unit ::= space* content* space*

units ::= unit ( unit_separator unit )*

record ::= units*

records ::= record ( record_separator record )*

group ::= records *

groups ::= group ( group_separator group )*

file ::= groups *

files ::= file ( file_separator file )*

usvx ::= \A ( units | records | groups | files ) unicode_newline \Z
