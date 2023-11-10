@echo off
setLocal enableextensions enabledelayedexpansion

rem 理由はわからないが、システムの環境変数に設定した npm を想定して "npm" で実行すると、
rem npm で読み込むモジュールを npm が存在するフォルダー配下ではなく、
rem このバッチの実行フォルダー配下にあるものとして読み込もうとして実行に失敗する。
rem そのため、このバッチ中では以下の環境変数 NPM を使う際は常に二重引用符 (") を使わずに展開するため、
rem 以下の環境変数 NPM に任意のパスを指定する時に、そのパスに**空白が含まれる場合**は
rem 以下のように必ず自分自身でパスの前後を二重引用符で囲うこと。
rem set NPM="C:\\a\b c\d\npm"
rem node はそうした動作はしないようだが、統一性を持たせるため NPM と同じ仕様にしている。
set NODE=node
set NPM=npm

set NODE_DOWNLOAD_PAGE_URL=https://nodejs.org/en/download

set SETUP_BAT_INPUT_PATH=gw.setup.bat.preset
set SETUP_BAT_OUTPUT_PATH=gw.setup.bat

set DEFAULT_INSTALL_MODULES=iconv-lite webpack webpack-cli babel-loader @babel/core @babel/preset-env core-js

:begin_process

call %NODE% --version > nul 2>&1

if errorlevel 1 (
	
	echo;
	echo お使いのシステムに Node.js がインストールされていないか、
	echo Node.js の実行に必要なパスが設定されていません。
	echo パスはシステムの環境変数か、このバッチファイル内で指定することができます。
	echo;
	call :require_node "%NODE_DOWNLOAD_PAGE_URL%"
	
	if "!requiresNode!" == "1" goto :begin_process
	
	goto :end_process
	
)

call %NPM% -version > nul 2>&1

if errorlevel 1 (
	
	echo;
	echo お使いのシステムに NPM がインストールされていないか、
	echo NPM の実行に必要なパスが設定されていません。
	echo Node.js のインストールが不十分である可能性があります。
	echo;
	call :require_node "%NODE_DOWNLOAD_PAGE_URL%"
	
	if "!requiresNode!" == "1" goto :begin_process
	
	goto :end_process
	
)

if "%~1" == "" (
	
	set option=
	
	echo;
	echo [インストールオプションを入力: ヘルプを表示=h]
	set /p option=^>
	echo;
	
) else (
	
	set option=%~1
	
	goto fetch_args
	
)

:fetched_args

if "%option%" == "h" (
	
	echo 以下は既定でインストールされるモジュールです。
	echo;
	
	call :view_module_list "%DEFAULT_INSTALL_MODULES%"
	echo;
	
	echo インストール先は以下です。
	echo;
	echo   "%appdata%\npm\node_modules\"
	echo;
	echo 既にインストールされている場合、上書きインストールされます。
	echo 以下のインストールオプションを入力できます。
	echo 未入力の場合、上記のモジュールだけをインストールします。
	echo;
	echo     --i module0 module1 module2...
	echo   既定でインストールするモジュールに加え、列挙したモジュールをインストールする
	echo;
	echo     --x
	echo   既定のモジュールのインストールをすべてスキップ
	echo;
	echo     --x module0 module1 module2...
	echo   列挙したモジュールのインストールのスキップ
	echo;
	echo     --xx
	echo   既定のモジュールのインストールをすべてスキップ。
	echo   --x と同時指定が可能です。
	echo;
	echo     --xx module0 module1 module2...
	echo   列挙したモジュールと既定のモジュールのインストールをすべてスキップ。
	echo   --x と同時指定が可能です。
	echo;
	echo     --u
	echo   --i に指定されたモジュールをアンインストールします。
	echo   --u だけを指定した場合、
	echo   既定でインストールされたモジュールをアンインストールします。
	echo   --x を指定していると、列挙したモジュールのアンインストールをスキップします。
	
	goto :begin_process
	
)

set parseOption=^
const	option = '%option%',^
		u = option.match(/(?:^^^|.*?\s+)--u(?:\s+.*?$^|$)/),^
		im = option.match(/(?:^^^|.*?\s+)--i(?:\s+(.*?)(?:\s*?^|\s+--.*?)$^|$)/)?.[1]?.trim?.()?.split?.(' ') ?? [],^
		xxm_ = option.match(/(?:^^^|.*?\s+)--xx(?:\s+.*?$^|$)/),^
		xxMatched = option.match(/(?:^^^|.*?\s+)--xx(?:\s+(.*?)(?:\s*?^|\s+--.*?)$^|$)/),^
		xxm = xxMatched ^&^& (xxMatched[1] ? xxMatched[1].trim().split(' ') : []),^
		xMatched = option.match(/(?:^^^|.*?\s+)--x(?:\s+(.*?)(?:\s*?^|\s+--.*?)$^|$)/),^
		xm = xMatched ^&^& (xMatched[1] ? xMatched[1].trim().split(' ') : []).concat(xxm ?? []),^
		im0 = [ ...new Set([ ...(((xm ^&^& xm.length === 0) ^|^| xxMatched) ? [] : '%DEFAULT_INSTALL_MODULES%'.split(' ')), ...im ]) ];^
console.log((u ? '_u_' : '___') + ' ' + (xm ? im0.filter(v =^> xm.indexOf(v) === -1) : im0).join('\n'));

set modules=
for /f "usebackq delims=" %%i in (`call %NODE% -e "%parseOption%"`) do set modules=!modules! %%i
rem for /f "usebackq" %%i in (`call %NODE% -e "%installModules%"`) do set modules=!modules! %%i

if "%modules:~1,3%" == "_u_" (
	set process=uninstall
	set processName=アンインストール
) else (
	set process=i
	set processName=インストール
)

set modules=%modules:~5%

if defined modules (
	
	echo 以下のモジュールが!processName!されます。
	echo;
	
	call :view_module_list "%modules%"
	
	echo;
	echo よろしければ y を入力してください。
	echo 未入力か、それ以外を入力すると、!processName!を中止して終了します。
	echo;
	echo [上記のモジュールを!processName!する=y]
	set /p confirm=^>
	echo;
	
	if /i not "!confirm!" == "y" endlocal&exit
	
	call %NPM% !process! -g%modules%
	
)

:create_setup_file

if exist "!SETUP_BAT_OUTPUT_PATH!" (
	
	echo これから作成するセットアップ用のファイル "!SETUP_BAT_OUTPUT_PATH!" と
	echo 同名のファイルが既に存在します。
	echo;
	echo [上書きする=未入力, 別の名前で新規作成する=任意の名前]
	set /p setupBatOutputPath=^>
	echo;
	
	if defined setupBatOutputPath set SETUP_BAT_OUTPUT_PATH=setupBatOutputPath&goto :create_setup_file
	
)

call %NODE% -e "^
const	fs = require('fs'),^
			path = require('path'),^
			iconv = require('%appdata:\=/%/npm/node_modules/iconv-lite'),^
			{ argv: { 1: installed, 2: node, 3: npm } } = process,^
			ws = fs.createWriteStream('%SETUP_BAT_OUTPUT_PATH%');^
ws.write(^
	iconv.encode(^
		iconv.decode(fs.readFileSync('%SETUP_BAT_INPUT_PATH%'), 'Shift-JIS').^
			replace(/^<\[path\]\[installed\]^>/gi, path.dirname(installed) + '\\').^
			replace(/^<\[path\]\[node\]^>/gi, node).^
			replace(/^<\[path\]\[npm\]^>/gi, npm),^
		'Shift_JIS'^
	)^
),^
ws.end();^
" %0 %NODE% %NPM%

echo セットアップ用のファイル "!SETUP_BAT_OUTPUT_PATH!" を作成しました。
echo プロジェクトを新規作成する際は、その都度
echo プロジェクトのルートフォルダーにこのファイルをコピーして実行してください。
echo;

:end_process

echo インストールを終了します。任意のキーを押してください。

endlocal
pause>nul
exit

:view_module_list

set values=console.log('%~1'.replace(/\s/g, '\n'));

for /f %%i in ('call %NODE% -e "%values%"') do echo   %%i

exit /b

:require_node

echo [既定のブラウザーで Node.js のダウンロードページを開く=y]
set /p openNodeDLPage=^>

if /i "!openNodeDLPage!" == "y" start "" %1

echo;
echo [このバッチファイルを再実行する=y]
set /p runAgain=^>

if /i "!runAgain!" == "y" set requiresNode=1

exit /b

:fetch_args

shift /1

if not "%~1" == "" (
	
	set option=!option! %1
	
	goto fetch_args
	
)

goto fetched_args