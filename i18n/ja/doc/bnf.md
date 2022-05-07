# BNF疑似コード


## 区切り文字

unit_separator ::= U+241F

record_separator ::= U+241E

group_separator ::= U+241D

file_separator ::= U+241C


## USV

unit ::= character *  # 区切り文字を除くすべての文字

units ::= unit ( unit_separator unit ) *

record ::= units *

records ::= record ( record_separator record ) *

group ::= records *

groups ::= group ( group_separator group ) *

file ::= groups *

files ::= file ( file_separator file ) *

usv ::= units | records | groups | files


## USVX

space ::= [:space:]  # スペース、タブ、垂直タブ、フォームフィード、改行、またはキャリッジリターン

unit ::= character *  # 区切り文字以外のすべての文字。先頭/末尾の空白は不可。

units ::= unit ( space* unit_separator space* unit ) *

record ::= units *

records ::= record ( space* record_separator space* record ) *

group ::= records *

groups ::= group ( space* group_separator space* group ) *

file ::= groups *

files ::= file ( space* file_separator space* file ) *

usvx ::= ( units or records or groups or files ) + newline
