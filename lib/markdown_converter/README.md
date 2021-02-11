# TDDBC旭川 課題：Markdown記法コンバータ

## reference
http://devtesting.jp/tddbc/?Markdown%E8%A8%98%E6%B3%95%E3%82%B3%E3%83%B3%E3%83%90%E3%83%BC%E3%82%BF

## お題の特徴
難易度は低めですが、全体（複数行）をコンバートする部分（アプリケーションのシステム境界の意識）と、個別のコンバート（ユニットテストとして推奨される単位）をどのようにバランスをとっていくか、リファクタリングしていくかがポイントとなります。

## お題１ テキストはp要素でラップされる
テストケース例） `"Hello, World"`は`"<p>Hello, World</p>"`に変換される。

## お題２ ヘッダ（Lv1）はh1要素でラップされる
テストケース例） `"# 見出し1"`は`"<h1>見出し1</h1>"`に変換される。

## お題３ ヘッダ（Lv2）はh2要素でラップされる
テストケース例） `"## 見出し2"`は`"<h2>見出し2</h2>"`に変換される。

## お題４ ヘッダをLv6まで対応する
## お題５ 強調表示（*で囲む）に対応する（strong要素）
## お題６ リスト記法（-）に対応する
## お題７ 複数行のMarkdownテキストを一括で変換する
## お題８ Markdownテキストが書かれたファイルを読み込み、変換結果をファイルに出力する

## How to use

```
ruby ./lib/markdown_converter/markdown_converter.rb ./lib/markdown_converter/input.md ./lib/markdown_converter/output.html
```

````
$ irb
> require './lib/markdown_converter/markdown_converter.rb'
> converter = Markdown_Converter.new  # 
> converter.convert_header("Hello, World")  # => "<p>Hello, World</p>"
> exit
````