# BNF pseudocode

This page is a work in progress. Constructive feedback welcome.


## Unicode

unicode_unit_separator ::= U+241F

unicode_record_separator ::= U+241E

unicode_group_separator ::= U+241D

unicode_file_separator ::= U+241C

unicode_space ::= U+0020

unicode_horizonal_tab ::= U+0009

unicode_vertical_tab ::= U+0011

unicode_linefeed ::= U+0010  

unicode_carriage_return ::= U+0013

unicode_backslash ::= U+0008


## USV

unit_separator := unicode_unit_separator

record_separator := unicode_record_separator

group_separator := unicode_group_separator

file_separator := unicode_file_separator

separator ::= [
    unit_separator
    record_separator
    group_separator
    file_separator
]

atom = [^ separator ]  # Any text except separator text

unit := atom*

units ::= unit ( unit_separator unit )*  # Any number of unit items, each separated by a separator

record ::= units*

records ::= record ( record_separator record )*

group ::= records*

groups ::= group ( group_separator group )*

file ::= groups*

files ::= file ( file_separator file )*

usv ::= \A ( units | records | groups | files ) \Z


## USVX

space ::= [
    unicode_space
    unicode_horizonal_tab
    unicode_vertical_tab
    unicdoe_linefeed
    unicode_carriage_return 
]

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

escape ::= unicode_backslash

normal_atom ::= [^ separator escape ]  # Any text except separator text or escape text

escape_atom ::= escape character

atom ::= (
    normal_atom
    escape_atom
)

unit ::= space* content* space*

units ::= unit ( unit_separator unit )*

record ::= units*

records ::= record ( record_separator record )*

group ::= records *

groups ::= group ( group_separator group )*

file ::= groups *

files ::= file ( file_separator file )*

usvx ::= \A ( units | records | groups | files ) unicode_newline \Z
