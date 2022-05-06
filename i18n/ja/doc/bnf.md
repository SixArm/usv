# BNF疑似コード

unit_separator ::= U+241F

record_separator ::= U+241E

group_separator ::= U+241D

file_separator ::= U+241C

unit ::= [character]+  # 4種類の区切り文字を除くすべての文字

units ::= unit ( unit_separator unit ) *

record ::= [units]*

records ::= record ( record_separator record ) *

group ::= [records]*

groups ::= group ( group_separator group ) *

file ::= [groups]*

files ::= file ( file_separator file ) *

usv ::= units or records or groups or files
