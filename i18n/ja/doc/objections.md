# 異論

USVに対して異論を持つ方もいるでしょう。私たちは、ここですべての建設的な異論に答えたいと思います。


## キーボードにUS、RS、GS、FSのキーがない

多くのシステムでは、Altキーを使って以下の方法でUnicode文字を入力することができます。

US: Altキーを押したまま「+241f」と打ち、Altキーを離す。

RS: Altキーを押したまま「+241e」と打ち、Altキーを離す。

GS: Altキーを押したまま「+241d」と打ち、Altキーを離す。

FS: Altキーを押したまま「+241c」と打ち、Altキーを離す。


## USVでは制御文字そのものではなく、制御文字を示す絵文字が使用されている。

はい。これは意図的なものです。

制御文字を使う方法や、さまざまなエディターで制御文字を示す絵文字をレンダリングするように設定することも試みました。

第一に、エディターの設定では、ゼロ幅の目に見えない文字を、幅を持った目に見える文字でレンダリングするように設定する際に多くの困難が生じました。

第二に、コピー＆ペースト機能でも問題がありました。エディターの実装とターミナルの実装では、下地にあるゼロ幅の目に見えない文字ではなく、文字幅を持った目に見える文字のほうがコピーされてしまうため、うまくいかないことが多くありました。

第三に、レンダリングされた制御文字の絵文字 (例えば、エディターがASCII 31を受け取ってUnicode Unit Separatorとしてレンダリングしたもの) と、データの中に含まれる制御文字の絵文字 (例えば誰かが実際にUnicode Unit Separatorをデータ内でタイプしたもの) をユーザーに区別してもらうことは困難です。


## USVではデータ内に制御文字の絵文字を含めることができない。

はい。これは意図的なものです。

例えば、ブログの記事がいくつかあり、その中でUSVの話題を扱い、画像文字を入れているとします。USVはできるだけシンプルであることを目指しており、データ内にUSV文字を含めることが禁止されているため、これをUSVだけでエクスポートすることはできません。

実世界のデータセットを何百と試し、また、USV文字を含むブログ記事などのデータコンテンツでも実験してみました。

どのようなケースでも、3つの良好なアプローチがあることがわかりました。

1つ目は、バックスラッシュでUSV文字をエスケープするなど、USVに機能拡張を追加した「USVXデータ形式」の利用を検討することです。

2つ目は、USV以外のデータ形式を検討することです。例えば、ユニット/列/セル、レコード/行/ライン、グループ/テーブル/グリッド、ファイル/スキーマ/フォリオといった同様の機能を提供するASVを用いることを検討できます。また、エスケープを伴うCSVを検討することもできます。さらに、より洗練されたJSONやXMLなどの形式、あるいはバイナリ形式も検討できます。

3つ目は、2段階のデータ形式を考えることです。データの中身を保護するためにエンコードを行った後、USVを使ってエクスポートするものです。例えば、典型的なHTMLのブログ記事では、山括弧やアンパサンドなどの一部の文字のエンコードがよく行われていますが、任意のUnicode文字をエンコードすることもできます。
