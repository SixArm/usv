# Unicode区切り値 (USV)

Unicode区切り値 (USV) は、データとデータの間にUnicode文字を配置するデータ形式です。

* ␟ = U+241F = US = ユニット区切り。データユニット間、データベースの列、スプレッドシートのセルなどの区切りに使用します。

* ␞ = U+241E = RS = レコード区切り。データレコード間、データベースの行、スプレッドシートの行などの区切りに使用します。

* ␝ = U+241D = GS = グループ区切り。データグループ間、データベースのテーブル、スプレッドシートのグリッドなどの区切りに使用します。

* ␜ = U+241C = FS = ファイル区切り。データファイル間、データベースのスキーマ、スプレッドシートのフォリオなどの区切りに使用します。

USVのファイル名の拡張子は ".usv " です。

USVのレポジトリは <https://github.com/sixarm/usv> です。

カンマ区切り値 (CSV)、タブ区切り値 (TSV)、ASCII区切り値 (ASV) をご存知なら、すでにUSVもほぼ知っていると言えます。

もっと多くの機能が必要な場合は、「Unicode区切り値拡張 (USVX)」を試してみてください。次のような機能が追加で利用できます:

* 空白文字のトリミング。USV文字の周囲の空白文字を扱うことができます。

* バックスラッシュのエスケープ。これにより、データコンテンツ内のUSV文字を保つことができます。

* 最後の改行文字。一部のエディターやツールに対してファイルの互換性を高めることができます。

USVXのファイル名の拡張子は ".usvx" です。

USVXのレポジトリは <https://github.com/sixarm/usvx> です。

カンマ区切り値 (CSV) に対するオプションでの空白文字のトリム、タブ区切り値 (TSV) に対するオプションでの文字エスケープ、ASCII区切り値 (ASV) でのオプションでの末尾改行を扱った経験があれば、すでにUSVXもほぼ知っていると言えます。


## ドキュメント

ドキュメントファイルはこちらです:

* [よくある質問](doc/faq.md)

* [USVで使用するUnicode文字の入力方法](doc/how-to-type-usv-unicode-characters.md)

* [TODOリスト](doc/todo.md)

* [規格化に向けたBNF (Backus-Naur形式) の提示](doc/bnf.md)

* [CSV、TSV、TDF、ASV、DELとの比較](doc/comparisons.md)

* [USVとUSVXへの異論](doc/objections.md)

* [ASCII区切り値 (ASV) の歴史](history-of-ascii-separated-values.md)


## 例

2ユニットのUSV:

```
a␟b
```

2ユニット×2レコードのUSV:

```
a␟b␞c␟d
```

2ユニット×2レコード×2グループのUSV:

```
a␟b␞c␟d␝e␟f␞g␟h
```

2ユニット×2レコード×2グループ×2ファイルのUSV:

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

USVは、意味を持つUnicode文字を使用しています。

USVは、典型的なUnicode対応のエディター、典型的なUnicode対応言語、典型的なUnicode対応フォントであれば、良好に機能します。

USVは文字幅を持った目に見える文字を使用してるため、視認、選択、コピー、ペースト、検索が容易です。

USVは、一般的なシェルスクリプト内で問題なく動作します。

USVは、一般的な検索ツールで問題なく動作します。

USVはエスケープ文字がないため、よりシンプルでわかりやすい使い方や書き方ができます。



## USVスクリプトの例

2ユニット×2レコードのUSVファイルのサンプルを作成する:

```
$ echo 'a␟b␞c␟d' > example.usv
```

`sed` を使ってUSVからCSVに変換する:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g;'
a,b
c,d
```

`tr` を使ってUSVをTSVに変換する:

```sh
$ cat example.usv | tr ␟␞ ',\n'
a,b
c,d
```

2ユニット×2レコード×2グループ×2ファイルのUSVファイルのサンプルを作成する:

```sh
echo "a␟b␞c␟d␝e␟f␞g␟h␜i␟j␞k␟l␝m␟n␞o␟p" > example.usv
```

`awk` を使ってUSVをTSVに変換する:

```sh
$ cat example.usv | awk 'BEGIN { FS="␟"; RS="␞"; OFS=","; ORS="\n"; } {$1=$1}1' | grep -v ^$
```

典型的なシェルコマンドでUSVを表示し、きれいに出力する:

```sh
$ cat example.usv | sed 's/␟/,/g; s/␞/\n/g; s/␝/\n---\n/g; s/␜/\n===\n/g;'
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

`bash`でシェルスクリプトを使ってUSV文字を表示する:

```bash
#!/usr/local/bin/bash
set -euf -o pipefail

# USV文字の使用方法を示すシェルスクリプトの例です。
# このスクリプトは、STDINから1文字ずつ読み取って出力します。
# これに似たUSVXのサンプルのシェルスクリプトもあり、そちらでは
# 空白文字のトリミングやバックスラッシュのエスケープといった拡張を示します。

while IFS= read -n1 -r c; do
    case  "$c" in
    "␟")
        printf "\nunit separator\n"
        ;;
    "␞")
        printf "\nrecord separator\n"
        ;;
    "␝")
        printf "\ngroup separator\n"
        ;;
    "␜")
        printf "\nfile separator\n"
        ;;
    *)
        printf %s "$c"
        ;;
    esac
done
```


## 結論

USVは余計なものがなく、シンプルで高速です。

USVXでは、空白文字のトリム、バックスラッシュのエスケープ、末尾改行などの追加機能が利用できます。

USVとUSVXは、多くのデータ形式プロジェクトでも実際に役に立っています。USVが皆さんの役にも立てればと思っています。

USVやUSVXに関する建設的な意見、git issue、pull request、標準化のお手伝いなどをお待ちしています。

<https://github.com/sixarm/usv>

<https://github.com/sixarm/usvx>
