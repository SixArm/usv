# ユニコード区切り値 (USV)

ユニコード区切り値 (USV) は、データとデータの間にユニコード文字を配置するデータ形式です。以下のユニコード文字を使用します:

* ␟ = U+241F = US = ユニット区切り。データユニット間、データベースの列、スプレッドシートのセルなどの区切りに使用します。

* ␞ = U+241E = RS = レコード区切り。データレコード間、データベースの行、スプレッドシートの行などの区切りに使用します。

* ␝ = U+241D = GS = グループ区切り。データグループ間、データベースのテーブル、スプレッドシートのグリッドなどの区切りに使用します。

* ␜ = U+241C = FS = ファイル区切り。データファイル間、データベースのスキーマ、スプレッドシートのフォリオなどの区切りに使用します。

カンマ区切り値 (CSV)、タブ区切り値 (TSV)、ASCII区切り値 (ASV) をご存知なら、すでにUSVもご存じでしょう。


## 例

2つのユニットからなるUSV:

```
a␟b
```

2つのレコードと、それぞれ2つのユニットからなるUSV:

```
a␟b␞c␟d
```

2つのグループ、それぞれ2つのレコード、それぞれ2つのユニットからなるUSV:

```
a␟b␞c␟d␝e␟f␞g␟h
```

2つのファイル、それぞれ2つのグループ、それぞれ2つのレコード、それぞれ2つのユニットからなるUSV:

```
a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p
```


## USVは簡単で親しみやすい

USVは簡単に使用でき、試してみたいと思える親しみやすさを織り込んでいます:

USVでは、さまざまな種類のデータを扱えます。USVに使用する4種類の文字を除き、あらゆる文字をデータに含めることができます。

USVはさまざまなエディターで扱うことができます。USVに使用する文字を表示できるエディタなら、どのエディターでも扱えます。vi、emacs、Coda、Notepad++、TextMate、Sublime、VS Codeなどで実際に利用できます。

USVは多様な種類のツールで動作します。USVに使用する文字をパースできるツールなら、どのツールでも動作します。awk、sed、grep、rg、miller などで実際に使えます。

USVはさまざまな言語で動作します。UTF-8の文字コードとレンダリングを扱える言語であれば、どの言語でも動作するはずです。C、Go、Java、JavaScript、Julia、Python、R、Ruby、Rust、Swift、PHPなどで実際に動作します。


## なぜUSVを使うのか

USVでは、カンマ、タブ、改行などの特殊文字を含むデータを、エスケープせずに扱うことができます。

USVは、ユニット/列/セル、レコード/行/ライン (CSVやTSVと同様) のほか、グループ/テーブル/グリッド、ファイル/スキーマ/フォリオ (ASVと同様) の形式を表現できます。

USVは国際標準を目指しています。

USVは、意味を持つユニコード文字を使用しています。

USVは、典型的なUnicode対応のエディター、典型的なUnicode対応言語、典型的なUnicode対応フォントであれば、良好に機能します。

USVは文字幅を持った目に見える文字を使用してるため、視認、選択、コピー、ペースト、検索が容易です。

USVは、一般的なシェルスクリプト内で問題なく動作します。

USVは、一般的な検索ツールで問題なく動作します。

USVはエスケープ文字がないため、よりシンプルでわかりやすい使い方や書き方ができます。


## 手伝ってくれる人のためのTODOリスト

LibreOffice Calc、Microsoft Excel、Google Sheetsなどの生産性アプリケーションへのUSV形式の追加。

R、Julia、MatLab、Mathematicaなどの統計システムへのUSV処理機能の追加。

Nodeパッケージ、Ruby gem、Rust crateなどの作成など、プログラミング言語へのUSVライブラリの追加。

Miller (対応済み)、TextQL (オープンissueあり)、Q (オープンissueあり)、jqなどのコマンドラインツールへのUSV機能の追加。


## よくある質問

<dl>

<dt>USVは簡単ですか？</dt>

<dd>

<p>はい。カンマ区切り値 (CSV)、タブ区切り値 (TSV)、ASCII区切り値 (ASV) をご存知なら、USVのこともほとんど理解できます。</p>

</dd>

<dt>USVは標準ですか？</dt>

<dd>

<p>その予定です。できる限り早期の標準化を目指しています。</p>

<p>USVはJoel Parker Henderson (joel@joelparkerhenderson.com) が中心となって提案した規格で、<a href="https://www.iana.org/assignments/media-types/text/tab-separated-values">IANA TSV</a>と同様の標準化を目指しています。</p>

</dd>

<dt>CSVやTSVではなくUSVを選ぶメリットは？</dt>

<dd>カンマ、タブ、改行をデータの中で使用することができます。データグループ、データベースのテーブル、スプレッドシートのグリッドをデータの中で示すことができます。データファイル、データベーススキーマ、スプレッドシートのフォリオをデータ形式の中で扱うことができます。CSVでは通常得られない、一貫性と互換性を備えた標準的な形式が必要な場合に適しています。CSV/TSV/TDFでは通常得られない、一貫性と互換性を備えた標準的なファイル拡張子が必要な場合に適しています。</dd>

<dt>ASVではなくUTFを選ぶメリットは？</dt>

<dd>データの中身を人間が読んだり編集したりする時のために、より扱いやすいものにすることができます。USVでは通常目に見える、文字幅を持ったUnicode 241Fなどの文字を使用します。これに対しASVでは、ASCII 31など、通常目に見えないゼロ幅の文字を使用します。エディターのなかには、それらに対応するUSVの可視文字などの視覚表現を使ってASV文字を表示してくれるものもありますが、実際にこの方法がサポートされる例はあまり見られませんでした。</p>

</dd>

<dt>機械のみが使用するデータにASFではなくUTFを選ぶメリットは？</dt>

<dd>人間が読んだり編集したりすることのない、機械のみが使用するデータの場合は、USVとASVのどちらもユニット、フィールド、グループ、ファイルなどが扱えるため、類似しています。

<dt>USVでは特殊文字のエスケープが可能ですか？</dt>

<dd>いいえ。意図的にエスケープを扱わない決断をしました。バックスラッシュ、アンパサンド、引用符、二重文字などで特別なエスケープ処理が行われることはありません。このエスケープ処理の方針により、USVはより簡単に使用でき、より速くパースでき、より明瞭に標準化することができます。文字エスケープについて調べたところ、エスケープは一部のニーズを解決する一方で、他のニーズに困難を生じさせることがわかりました。現実の英語のテキストではカンマが頻繁に使われるため、CSVのエスケープは非常に重要であるという結論に達しました。USVでは、このようなニーズが頻繁に生じることはありません。</dd>

<dt>特殊文字のエスケープがどうしても必要な場合はどうすればよいですか？</dt>

<dd>Some people really want special character escaping. For example, suppose you have data content that contains USV characters. For these inds of goals, you may want to use a different format with more power (such as JSON or XML), or you may want to create your own non-USV internal encoding akin to HTML ampersand encoding (such as "&us;" meaning unit separator) or Unicode backslash-u encoding (such as "\u241F").</dd>

<dt>Does USV have special whitespace handling?</dt>

<dd>No. This is a deliberate decision. There is no special treatment of whitepace, such as spaces, tabs, newlines, etc. This enables USV be simpler to use, faster to parse, and clearer to standardize. When we researched whitespace handling, we found that it solved some needs, yet caused difficulties for other needs. We concluded that whitespace handling can be convenient, yet is not a must-have, and thus must be ommitted from the USV standard.
</dd>

<dt>What if I really want special whitespace handling?</dt>

<dd>Some people really want special whitespace handling. For example, suppose you want surrounding whitespace, such for a newline before the USV character and/or a newline after the USV character. For these kinds of goals, you can use USV as usual, then afterwards add your own whitepace handling, such as calling a function `trim` or `strip` or `chomp`.</dd>

</dl>


## Pull requests for USV 

Open pull requests:

* Q: <https://github.com/harelba/q/issues/201>

* TextQL: https://github.com/dinedal/textql/issues/115

Completed pull requests:

* Miller: <https://github.com/johnkerl/miller/issues/245>


## Comparison to CSV, TSV and TDF, ASV and DEL

Unicode separated values (USV) is a data format similar in purpose to other formats.

<dl>

<dt>comma separated values (CSV)</dt>

<dd>CSV format uses a comma to separate values, and a newline to separate records. In our experience, the CSV format has various kinds of implementations, some incompatible, some with escaping and some without. In our experience, some software programs use the file name extension ".csv" to mean other ways of separating data with other characters, such as using tabs, or semi-colons, or spaces. CSV handles data units/columns/cells and data records/rows/lines, but does not handle data groups/tables/grids or data files/schemas/folios.</dd>

<dt>tab separated values (TSV) a.k.a. tab delimited format (TDF)</dt>

<dd>TSV format uses a tab to separate values, and a newline to separate records. In our experience, the TSV format can be difficult to edit with some editors, because the tab character can be invisible, or can take up a varying number of character widths such as the equivalent of 2 spaces, or 4 spaces, or 8 spaces, or as many spaces as it takes to get to the next tab stop. TSV handles data units/columns/cells and data records/rows/lines, but does not handle data groups/tables/grids or data files/schemas/folios.</dd>

<dt>ASCII separated values (ASV) a.k.a. DEL (Delimited ASCII)</dt>

<dd>ASV format uses ASCII character 28 as file separator, 29 as group separator, 30 as record separator, 31 as unit separator. ASV and USV both handle all the same data separations. In our experience, these ASCII characters tend to be hard to edit manually, because many editors treat the characters as invisible zero-width characters. USV uses the same semantics, yet with visible letter-width characters.</dd>

</dl>


## Example scripts

Create an example USV file with 3 units by 3 records:

```
$ echo 'a␟b␟c␞d␟e␟f␞g␟h␟i' > example.usv
```

Convert USV to CSV by using `sed`:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g;' 
```

Convert USV to TSV by using `tr`:

```sh
$ cat example.usv | tr ␟␞ ',\n'
```

Convert USV to TSV by using `awk`:

```sh
$ cat example.usv | awk 'BEGIN { FS="␟"; RS="␞"; OFS=","; ORS="\n"; } {$1=$1}1' | grep -v ^$
```

Display USV with typical shell commands and pretty output:

```sh
$ echo "a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p" | 
  sed 's/␟/,/g; s/␞/\n/g; s/␝/\n---\n/g; s/␜/\n===\n/g;'
a,b
c,d
---
e,f
g,h
===
i,j
k,l
---
m,n
o,p
```


## BNF pseudocode

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


## History of ASCII separated values (ASV)

➤ <https://www.lammertbies.nl/comm/info/ascii-characters>

<dl>

<dt>ASCII 28 = FS = File separator</dt>

<dd>The file separator FS is an interesting control code, as it gives us insight in the way that computer technology was organized in the sixties. We are now used to random access media like RAM and magnetic disks, but when the ASCII standard was defined, most data was serial. I am not only talking about serial communications, but also about serial storage like punch cards, paper tape and magnetic tapes. In such a situation it is clearly efficient to have a single control code to signal the separation of two files. The FS was defined for this purpose.</dd>

<dt>ASCII 29 = GS = Group separator</dt>

<dd>Data storage was one of the main reasons for some control codes to get in the ASCII definition. Databases are most of the time setup with tables, containing records. All records in one table have the same type, but records of different tables can be different. The group separator GS is defined to separate tables in a serial data storage system. Note that the word table wasn't used at that moment and the ASCII people called it a group.</dd>

<dt>ASCII 30 = RS = Record separator</dt>

<dd>Within a group (or table) the records are separated with RS or record separator.</dd>

<dt>ASCII 31 = US = Unit separator</dt> 

<dd>The smallest data items to be stored in a database are called units in the ASCII definition. We would call them field now. The unit separator separates these fields in a serial data storage environment. Most current database implementations require that fields of most types have a fixed length. Enough space in the record is allocated to store the largest possible member of each field, even if this is not necessary in most cases. This costs a large amount of space in many situations. The US control code allows all fields to have a variable length. If data storage space is limited—as in the sixties—this is a good way to preserve valuable space. On the other hand is serial storage far less efficient than the table driven RAM and disk implementations of modern times. I can't imagine a situation where modern SQL databases are run with the data stored on paper tape or magnetic reels.</dd>


## Conclusion

USV is helping us with real-world data format projects, and we hope USV can be helpful to you too.

We welcome constructive feeback about USV, as well as git issues, pull requests, and standardization help.
