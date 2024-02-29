# BNF pseudocode

This page is a work in progress. Constructive feedback welcome.


## Unicode symbols

unicode_symbol_for_file_separator ::= U+241C

unicode_symbol_for_group_separator ::= U+241D

unicode_symbol_for_record_separator ::= U+241E

unicode_symbol_for_unit_separator ::= U+241F

unicode_symbol_for_shift_in ::= U+240F

unicode_symbol_for_shift_out ::= U+240E

unicode_symbol_for_escape ::= U+241B

unicode_symbol_for_end_of_transmission_block ::= U+2417


## Unicode spaces - currently unused

unicode_space ::= U+0020

unicode_horizontal_tab ::= U+0009

unicode_vertical_tab ::= U+0011

unicode_linefeed ::= U+0010

unicode_carriage_return ::= U+0013


## USV

This section is intended to convey the concept of USV.

any_character ::= '*'

special_character ::= [
    unicode_symbol_for_unit_separator
    unicode_symbol_for_record_separator
    unicode_symbol_for_group_separator
    unicode_symbol_for_file_separator
    unicode_symbol_for_shift_in
    unicode_symbol_for_shift_out
    unicode_symbol_for_escape
    unicode_symbol_for_end_of_transmission_block
]

content := ( any_character - special_character ) ∪ ( escape any_character )

unit := *content

units ::= unit *( unicode_symbol_for_unit_separator unit )

record ::= *units

records ::= record *( unicode_symbol_record_separator record )

group ::= *records

groups ::= group *( unicode_symbol_group_separator group )

file ::= *groups

files ::= file *( unicode_symbol_file_separator file )

level = :: unicode_symbol_for_shift_in *?any unicode_symbol_for_shift_out

levels = ::= levels*

usv ::= \A ( units | records | groups | files | levels ) \Z)

TODO:

* Add syntax for unicode_symbol_for_end_of_transmission.

* Add syntax for a level that contains units, records, groups, files.
