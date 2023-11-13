[🌐 Webpack]: https://webpack.js.org/
[🌐 バッチファイル]: https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB
[🌐 トランスパイル]: https://ja.wikipedia.org/wiki/%E3%83%88%E3%83%A9%E3%83%B3%E3%82%B9%E3%82%B3%E3%83%B3%E3%83%91%E3%82%A4%E3%83%A9
[🌐 Node.js]: https://nodejs.org/
[🌐 iconv-lite]: https://www.npmjs.com/package/iconv-lite
[🌐 webpack]: https://www.npmjs.com/package/webpack
[🌐 webpack-cli]: https://www.npmjs.com/package/webpack-cli
[🌐 babel-loader]: https://www.npmjs.com/package/babel-loader
[🌐 @babel/core]: https://www.npmjs.com/package/@babel/core
[🌐 @babel/preset-env]: https://www.npmjs.com/package/@babel/preset-env
[🌐 core-js]: https://www.npmjs.com/package/core-js

[📁 ***プロジェクトフォルダー***]: #-プロジェクトフォルダー
[*プロジェクトフォルダー*]: #-プロジェクトフォルダー
[📁 ***インストールフォルダー***]: #-インストールフォルダー
[*インストールフォルダー*]: #-インストールフォルダー
[📁 ***gw***]: #-gw
[*gw*]: #-gw
[📁 ***presets***]: #-presets
[*presets*]: #-presets
[📁 ***setup***]: #-setup
[*setup*]: #-setup
[📁 ***config***]: #-config
[*config*]: #-config
[📁 ***setting***]: #-setting
[*setting*]: #-setting
[📁 ***setup\****]: #-setup
[*setup\**]: #-setup-1
[📁 ***config***]: #-config
[*"config.bat"*]: #-configbat

[📄 ***install.bat***]: #-installbat
[*install.bat*]: #-installbat
[📄 ***gw.setup.bat***]: #-gwsetupbat
[📄 ***gw.bundle.bat***]: #-gwbundlebat
[📄 ***gw.bundle-watched.bat***]: #-gwbundle-watchedbat
[📄 ***index.html***]: #-indexhtml

[📄 ***index.html***]: #-indexhtml
[📄 ***index.js***]: #-gwindexj
[📄 ***webpack.config.js***]: #-webpackconfigjs
[📄 ***config.mjs***]: #-configmjs
[📄 ***gw.placeholder.json***]: #-gwplaceholderjson

[🧩 ***langs***]: #-langs
[🧩 *setting*]: #-setting

# 🚩 概要
　[🌐 Webpack] と、関連するモジュールをグローバルインストールして、任意のフォルダー（以下 [📁 ***プロジェクトフォルダー***]）内からそれらを通じてスクリプトをバンドルする環境を整える [🌐 バッチファイル]集です。レガシーな環境でも動作するように [🌐 トランスパイル]した JavaScript を最**低**限の構成と設定でバンドルします。

# ❓ 使い方
　インストールおよびバンドルの実行には [🌐 Node.js] が必要です。Node.js をインストールしていない場合は、あらかじめ[ 🌐 ダウンロード](https://nodejs.org/en/download)してインストールしてください。
1. 任意のフォルダー内で [📄 ***install.bat***] を実行してください。実行したフォルダー（以下 [📁 ***インストールフォルダー***]）のパスは、インストールフォルダーのパスとして各スクリプトや設定ファイル内で使用されるため、フォルダーを移動するなど、[📁 ***インストールフォルダー***]のパスに変更がある際は、変更後に改めて [📄 ***install.bat***] を実行し直してください。
1. インストール後、[📄 ***install.bat***] と同じフォルダー内に生成される [📄 ***gw.setup.bat***] を、[📁 ***プロジェクトフォルダー***]内にコピーして実行してください。このフォルダーのパスは [📁 ***プロジェクトフォルダー***]のパスとして各スクリプトや設定ファイル内で使用されます。フォルダーを移動するなど、[📁 ***プロジェクトフォルダー***]のパスに変更がある際は、変更後に改めて [📄 ***gw.setup.bat***]@[*プロジェクトフォルダー*]を実行してください。
1. 実行後、フォルダー内に [📄 ***gw.bundle.bat***](#-gwbundlebat), [📄 ***gw.bundle-watched.bat***](#-gwbundle-watchedbat) が生成されるので、スクリプトをバンドルする際はそのいずれかを実行してください。既定の状態であれば動作確認のためのプロジェクトが同時に生成されます。バンドル後、[📄 ***index.html***]@[*プロジェクトフォルダー*]を開き、アラートがポップアップして `👋 Hi, world.` と表示されていればトランスパイルおよびバンドルができています。

## 🧯 アンインストール
　このバッチファイルからシステムファイルへの書き込みは行なわないためアンインストールは不要ですが、このバッチファイルからインストールしたモジュールや、生成したファイルを削除したい場合は以下の手順に従ってください。
1. 既定でグローバルインストールされるモジュールをアンインストールしたい場合は、[📄 ***install.bat***]@[*インストールフォルダー*] を実行後、コンソール画面で[*インストールオプション  `--u`*](#--u) を入力してください。
2. インストールフォルダーや、生成したプロジェクトフォルダー内のファイルなどは任意で削除してください。

# 🗂️ ファイル構成

## 📁 インストールフォルダー

## 📁 presets @[*インストールフォルダー*]
　[📄 ***gw.setup.bat***]@[*プロジェクトフォルダー*]実行後に生成されるファイルの元になるファイルが入ったフォルダーです。

## 📄 gw.bundle.bat.preset @[*インストールフォルダー*]\\[*presets*]
　[📄 ***gw.bundle.bat***]@[*プロジェクトフォルダー*]の元になるファイルです。

## 📄 gw.bundle-watched.bat.preset @[*インストールフォルダー*]\\[*presets*]
　[📄 ***gw.bundle-watched.bat***]@[*プロジェクトフォルダー*]の元になるファイルです。

## 📄 index.html.template @[*インストールフォルダー*]\\[*presets*]
　[📄 ***index.html***]@[*プロジェクトフォルダー*]の元になるファイルです。

## 📄 index.js.preset @[*インストールフォルダー*]\\[*presets*]
　[📄 ***index.js***]@[*プロジェクトフォルダー*]\\[*gw*] の元になるファイルです。

## 📄 webpack.config.js.preset @[*インストールフォルダー*]\\[*presets*]
　[📄 ***webpack.config.js***]@[*プロジェクトフォルダー*] の元になるファイルです。

## 📁 setup @[*インストールフォルダー*]
　バンドル環境を構築するためのファイルが入ったフォルダーです。

## 📁 config @[*インストールフォルダー*]\\[*setup*]
　[📄 ***config.bat***](#-configbat)@[*インストールフォルダー*]\\[*setup*] で使うファイルが入ったフォルダーです。

## 📁 langs @[*インストールフォルダー*]\\[*config*]\\[*setup*]
　[📄 ***config.mjs***](#-configmjs)@[*インストールフォルダー*]\\[*setup*]\\[*config*] で表示するメッセージを言語別に [🌐 JSON](https://ja.wikipedia.org/wiki/JavaScript_Object_Notation) で記述したファイルが入ったフォルダーです。現状は 📄 ja-JP.json しか存在しませんが、任意で追加することができます。追加した言語を表示する場合は、任意の [📄 ***gw.placeholder.json***] 内のプロパティ [🧩 ***langs***]@[*setting*].[*setup\**][[*"config.bat"*]] の値に、その言語名を追加してください。

[📄 ***cascade.mjs***]: #-cascade
[📄 ***config.mjs***]: #-configmjs
[📄 ***config.bat***]: #-configbat
## 📄 cascade.mjs @[*インストールフォルダー*]\\[*config*]\\[*setup*]
　[📄 ***config.mjs***]@[*インストールフォルダー*]\\[*config*]\\[*setup*] で使うスクリプトです。

## 📄 config.mjs @[*インストールフォルダー*]\\[*config*]\\[*setup*]
　[📄 ***config.bat***]@[*インストールフォルダー*]\\[*config*]\\[*setup*] の実際の処理を担う JavaScript です。バンドル環境を構築するためのファイルを生成します。

## 📄 config.bat @[*インストールフォルダー*]\\[*config*]\\[*setup*]
　バンドル環境を構築するファイルを生成します。

## 📄 install.bat @[*インストールフォルダー*]
　実行するとインストールを行ないます。以下のインストールオプションを実行後にコンソールから入力するか、起動オプションとして指定することができます。

### オプション @[*インストールフォルダー*]\\[*install.bat*]
#### `--i module[ module0 module1 ...moduleN]`
　既定でインストールされるモジュールに加えてインストールするモジュールを、半角スペースで区切って任意の数だけ列挙します。列挙したモジュール名はすべてグローバルインストールされます。既定でインストールされるモジュールも含め、インストールの対象のモジュールが既にインストールされている場合、モジュールは上書きインストールされます。既定では以下のモジュールがインストールされます。
<style>.a {background-color:red;}</style>
<p class="a">hi</p>

+ [🌐 iconv-lite]
+ [🌐 webpack]
+ [🌐 webpack-cli]
+ [🌐 babel-loader]
+ [🌐 @babel/core]
+ [🌐 @babel/preset-env]
+ [🌐 core-js]

#### `--x[ modulemodule0 module1 ...moduleN]`
　`--x` に続いて列挙した、半角スペースで区切られた任意の数のモジュールのいずれかが、インストールされるモジュール内に含まれる場合、そのモジュールのインストールをスキップします。モジュール名を指定せずに入力すると、既定でインストールされるモジュールのインストールをすべてスキップします。これは `--x webpack webpack-cli babel-loader @babel/core @babel/preset-env core-js` と同等です。

#### `--xx[ module, module0, ...moduleN]`
　[*オプション `--x`*](#--x-modulemodule0-module1-modulen) と同じ機能を持ちますが、このオプションでは既定でインストールされるモジュール群のインストールを暗黙でスキップします。これは [📄 *--x*](#--x-modulemodule0-module1-modulen) の単体指定と同等ですが、モジュール名を列挙して [📄 *--x*](#--x-modulemodule0-module1-modulen) を指定する時に、それに既定のモジュール群を含める場合、[📄 *--x*](#--x-modulemodule0-module1-modulen) の場合は各モジュール名を明示的に列挙する必要がありますが、このオプションを使うとそれを省略することができます。例えば `--i express --x babel-loader @babel/core @babel/preset-env express` と `--i express --xx express` は同等です（なお、この場合 express はインストールされません）。また `--xx` の単体指定も [📄 *--x*](#--x-modulemodule0-module1-modulen) と同等です。

　このオプションが想定する使用ケースは、[*オプション `--i`*](#--i-module-module0-module1-modulen) に任意の値を取る場合で、その中にインストールを拒否したいモジュールがあり、かつ既定のモジュール群のインストールをスキップすることが決まっていて、その指定を省略したいと言う時など、極めて稀に思われます。

#### `--u`

　このオプションを指定すると、既定でインストールされるモジュール群に加え、[*オプション `--i`*](#--i-module-module0-module1-modulen) に列挙されたモジュールをアンインストールします。このオプションは値を取りません。[*オプション `--x`*](#--x-modulemodule0-module1-modulen), [*オプション `--xx`*](#--xx-module-module0-modulen) が指定されている場合、それらの指定に基づいて、アンインストールされるモジュールから列挙されたモジュールや既定でインストールされるモジュールのアンインストールをスキップします。単体指定の `--u` は、`--u --i iconv-lite webpack webpack-cli babel-loader @babel/core @babel/preset-env core-js` と同等です。

#### `h`
　インストールのヘルプを表示します。他のオプションと同時に指定することはできません。

### 📄 gw.setup.bat
　[📄 *インストールフォルダー\install.bat*](#installbat) 実行後に生成される [🌐 バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)です。このファイルを任意のプロジェクトフォルダー内にコピーすることで、バンドル環境を構築します。

### 📄 gw.setup.bat.preset
　[📄 *インストールフォルダー\gw.setup.bat*](#gwsetupbat) の元になるファイルです。

### 📄 gw.placeholder.json
　[📄 *プロジェクトフォルダー\gw.setup.bat*](#gwsetupbat) の実行時に参照される [🌐 JSON](https://ja.wikipedia.org/wiki/JavaScript_Object_Notation) です。このファイルは任意の場所に作成することができますが、参照されるのはプロジェクトフォルダー内からそれが属するドライブのルートまでの各フォルダー内と、インストールフォルダー内の順番です。優先度は、プロジェクトフォルダーがもっとも高く、それから離れるにつれて低くなります。*📄 インストールフォルダー\gw.placeholder.json* が存在しない時の動作は想定していないため、同ファイルは削除しないようにしてください。また、インストールフォルダー外の 📄 *gw.placeholder.json* は独自に作成する必要があります。

　プロジェクトフォルダー内、その上位、インストールフォルダー内の順で以下のような 📄 *gw.placeholder.json* が存在する場合、プロジェクトフォルダー内から参照される JSON が示すプロパティは下端の例のようになります。
```js
// プロジェクトフォルダー内の gw.placeholder.json
{
	"a": 0
}
// プロジェクトフォルダーの上位フォルダー内の gw.placeholder.json
{
	"b": {
		"a": 1
	},
}
// インストールフォルダー内の gw.placeholder.json
{
	"a": 2,
	"b": 3,
	"c": 4
}
```
```js
global['gw.placeholder.json'].a;   // 0
global['gw.placeholder.json'].b.a; // 1
global['gw.placeholder.json'].c;   // 4

// あくまで例示で、こうしたオブジェクトが実際にどこかに作られるわけではありません。
```

　このファイルに記述された JSON の値は、[📄 *プロジェクトフォルダー\gw.setup.bat*](#-gwbundlebat) によって生成されるファイル内に記されたプレースホルダーを通じて参照し、またそれ自身を置換することができます。プレースホルダーは `<` で始まり、次に `[` と `]` の中に、参照する 📄 *gw.placeholder.json* 内のプロパティ名を記し、最後に `>` で閉じます。参照したいプロパティがネストしている場合、プロパティ名を記す部分を連ねて書きます。各記号間の空白やタブ、改行は許容されます。

```js
// gw.placeholder.json
{
	a: 0,
	b: {
		a: {
			a: 1
		}
	}
}
```
```
上記のような gw.placeholder.json だった場合...

置換前: プロパティ a の値は <[a]> です。
置換後: プロパティ a の値は 0 です。

置換前: プロパティ b.a.a の値は <[b][a][a]> です。
置換後: プロパティ b.a.a の値は 1 です。
```

　現状ではプレースホルダーをエスケープすることはできません。[正規表現](https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_expressions) `/<\s*?(\[.*?\])\s*?>/` に一致する文字列はすべてプレースホルダーとして認識されます。ただし、プレースホルダーが示すプロパティが、プロジェクトフォルダーから辿れるすべての 📄 *gw.placeholder.json* が示す JSON 内に存在しない場合は、プレースホルダーは置換されません。

　📄 *gw.placeholder.json* 内では任意のプロパティを設定することができますが、以下のような固有のプロパティも存在します。
#### 📦 preset
　環境構築時に生成するファイルの情報を示す記述子（descriptor）をプロパティにした [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。キーは記述子の名前を示し、一意である必要がありますが、任意の名前にすることができます。

#### 🧩 preset[descriptor].path
　ファイルのパスを示す文字列です。

#### 🧩 preset[descriptor].dst
　生成したファイルのフォルダーパスを示します。ファイル名は含めないでください。

#### 🧩 preset[descriptor].renameRx
　生成したファイルのファイル名を、[🌐 String.prototype.replace()](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String/replace) の引数に対応する値を列挙した [🌐 Array](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array) で指定します。 String.prototype.replace() は、[📄 *preset[descriptor].path*](#presetsdescriptorpath) で指定したパスから取得されるファイル名に対して実行されます。

　Array の 0 番目の要素には、[🌐 RegExp のコンストラクター](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/RegExp/RegExp)の引数に対応する値を列挙した Array を指定します。

#### 📦 placeholder
　[🧩 *preset*](#preset) に指定されたファイル内に存在するプレースホルダーを置換するプロパティを持つ [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。実際には 📄 *gw.placeholder.json* 内のプロパティはすべてプレースホルダーから参照可能であるため、他のプロパティと役割的な差異はほとんどありません。ただし、この Object に含まれる一部のプロパティは、[📁 *インストールフォルダー\presets*](#presets) 内のファイルから参照される他、[📄 *プロジェクトフォルダー\gw.setup.bat*]() 実行時に値を動的に設定されます。

#### 🧩 placeholder.sourcesDirName
　バンドルするファイルが入ったフォルダーパスを指定します。この値は [📄 *setup\config.bat*](#-setupconfigbat) を通じて動的に定義されます。既定値は `gw` です。

#### 🧩 placeholder.importFileName
　バンドルするファイルの名前を指定します。この値は [📄 *setup\config.bat*](#-setupconfigbat) を通じて動的に定義されます。既定値は [📄 *gw\index.js*](#gwindexjs) です。

#### 🧩 placeholder.bundledFileName
　バンドルしたファイルの名前を指定します。この値は [📄 *インストールフォルダー\setup\config.bat*](#-setupconfigbat) を通じて動的に定義されます。既定値は `gw.js` です。（この既定値の拡張子を除いたファイル名は [🧩 *placeholder.sourcesDirName*](#placeholder.sourcesDirName) の値に由来します）

#### 📦 placeholder["index.html"]
　[📄 *インストールフォルダー\presets\index.html.template*](#presetsindexhtmltemplate) に存在するプレースホルダーを示すプロパティを持った [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。

#### 🧩 placeholder["index.html"].charset
　[📄 *プロジェクトフォルダー\index.html*](#indexhtml) の [タグ`<meta>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/meta) の [属性 `charset`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/meta#charset) の値を示します。生成される [📄 *プロジェクトフォルダー\index.html*](#indexhtml) の文字コードを指定することができます。既定値は `utf-8` です。

#### 🧩 placeholder["index.html"].lang
　[📄 *プロジェクトフォルダー\index.html*](#indexhtml) の [タグ `<html>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/html) の [属性 `lang`](https://developer.mozilla.org/ja/docs/Web/HTML/Global_attributes/lang) の値を示します。生成される [📄 *プロジェクトフォルダー\index.html*](#indexhtml) の言語を指定することができます。既定値は `ja` です。

#### 🧩 placeholder["index.html"].title
　[📄 *プロジェクトフォルダー\index.html.template*](#presetsindexhtmltemplate) から生成される [`index.html`](#indexhtml) の [タグ `<title>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/title) の内容を示します。生成される [📄 *プロジェクトフォルダー\index.html*](#indexhtml) のタイトルを指定することができます。既定値は `Hi, world.` です。

#### 📦 placeholder["index.js"]
　[📄 *プロジェクトフォルダー\index.js.preset*](#presetsindexjspreset) から生成される [📄 *gw\index.js*](#gwindexjs) 内で使われるプレースホルダーを示すプロパティを持った [Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。[📄 *gw\index.js*](#gwindexjs) はバンドルされるファイルの読み込み元となるファイルです。

#### 🧩 placeholder["index.js"].sample
　[📄 *プロジェクトフォルダー\gw\index.js*](#gwindexjs) に挿入されるサンプルコードを指定します。以下は既定値です。
```javascript
(async emoji => { for await (const v of { async *[Symbol.asyncIterator]() { yield Promise.resolve(((...args) => args.at(1) + args[0].at(1))`${'Hi'}, world.`).then(message => /\\p{Basic_Emoji}/v.test(emoji) && message.replaceAll(/(hi)/gi, `${emoji} $1`)); } }) alert(v); })('👋');
```

#### 📦 setting
　この [🌐 バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)に関連したファイルの設定を示すプロパティを持つ [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。

#### 📦 setting.setup
　[📁 *インストールフォルダー\setup*](#-setup) 内のファイルの設定を示すプロパティを持つ [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。

#### 📦 setting.setup["config.bat"]
　[📄 *setup\config.bat*](#-setupconfigbat) から実行されるファイルの設定を示すプロパティを持つ [🌐 Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) です。

#### 🧩 setting.setup["config.bat"].langs
　[📄 *setup\config.bat*](#-setupconfigbat) で表示されるメッセージの言語名を [🌐 String](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/String) で列挙した [🌐 Array](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Array) です。任意の数の言語を指定でき、左から順に優先度が落ちます。既定値は `[ "ja-JP" ]` です。また現状の対応言語は `ja-JP` のみです。

### 📄 gw.setup.bat.preset
　[📄 *プロジェクトフォルダー\gw.setup.bat*](#gwsetupbat) の元になるファイルです。


## 📁 プロジェクトフォルダー
　プロジェクトフォルダーでは、同フォルダー内で `gw.setup.bat` を実行したあとに以下のファイルとフォルダーが生成されます。
### 📁 gw
　バンドルするファイルを入れるフォルダーです。既定では、このフォルダー内にある [📄 *gw\index.js*](#gwindexjs) から読み込まれる一連のファイルを、プロジェクトフォルダー直下に `gw.js` としてバンドルします。

#### 📄 gw\index.js
　バンドル元となる JavaScript です。[JSON](https://ja.wikipedia.org/wiki/JavaScript_Object_Notation) [📄 *gw.placeholder.json*](#gwplaceholderjson) の設定に基づいてサンプルコードが挿入されます。既定では、[📄 *プロジェクトフォルダー\gw.bundle.bat*](#-gwbundlebat), [📄 *プロジェクトフォルダー\gw.bundle-watched.bat*](#gwbundle-watchedbat) の実行時にこのファイルが読み込まれます。

### 📄 gw.bundle.bat
　バンドルを実行する[バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)です。既定では、プロジェクトフォルダー直下に `gw.js` を生成します。

### 📄 gw.bundle-watched.bat
　バンドルを自動で行なう[バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)です。実行すると待機して、[*フォルダー `gw`*](#gw) 内のファイルに変更がある度にバンドルを実行します。既定では、プロジェクトフォルダー直下に `gw.js` を生成します。

### 📄 gw.js
　バンドルを実行する[バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)です。既定では、プロジェクトフォルダー直下に `gw.js` を生成します。

### 📄 gw.setup.bat
　[`インストールフォルダー\gw.setup.bat`]() からプロジェクトフォルダー内に任意でコピーされた[バッチファイル](https://ja.wikipedia.org/wiki/%E3%83%90%E3%83%83%E3%83%81%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB)で、プロジェクトフォルダー内にバンドル環境を構築します。

### 📄 index.html
　プロジェクトの HTML です。既定では、[📄 *gw.bundle.bat*](#-gwbundlebat), [📄 *gw.bundle-watched.bat*](#gwbundle-watchedbat) を通じて生成された、プロジェクトフォルダー直下の `gw.js` を読み込みます。

　HTML 内の一部の要素の属性や内容は、[JSON](https://ja.wikipedia.org/wiki/JavaScript_Object_Notation) [📄 *gw.placeholder.json*](#gwplaceholderjson) 内の [Object](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Object) [📄 *placeholder["index.html"]*](#placeholderindexhtml) が持つプロパティやその値を変じて任意のものに変更することができます。

### 📄 webpack.config.js
　[Webpack](https://webpack.js.org/) の[バンドル設定](https://webpack.js.org/configuration/)を行なうファイルです。既定では最低限の設定しかしていないため、用途に応じて変更することを強く推奨します。


# 既知の不具合
+ ドライブ直下で `gw.setup.bat` を実行後、生成された [📄 *gw.bundle.bat*](#-gwbundlebat), [📄 *gw.bundle-watched.bat*](#gwbundle-watchedbat) を実行すると Webpack の実行に失敗する。