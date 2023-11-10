@echo off
setLocal enableextensions enabledelayedexpansion

rem ���R�͂킩��Ȃ����A�V�X�e���̊��ϐ��ɐݒ肵�� npm ��z�肵�� "npm" �Ŏ��s����ƁA
rem npm �œǂݍ��ރ��W���[���� npm �����݂���t�H���_�[�z���ł͂Ȃ��A
rem ���̃o�b�`�̎��s�t�H���_�[�z���ɂ�����̂Ƃ��ēǂݍ������Ƃ��Ď��s�Ɏ��s����B
rem ���̂��߁A���̃o�b�`���ł͈ȉ��̊��ϐ� NPM ���g���ۂ͏�ɓ�d���p�� (") ���g�킸�ɓW�J���邽�߁A
rem �ȉ��̊��ϐ� NPM �ɔC�ӂ̃p�X���w�肷�鎞�ɁA���̃p�X��**�󔒂��܂܂��ꍇ**��
rem �ȉ��̂悤�ɕK���������g�Ńp�X�̑O����d���p���ň͂����ƁB
rem set NPM="C:\\a\b c\d\npm"
rem node �͂�����������͂��Ȃ��悤�����A���ꐫ���������邽�� NPM �Ɠ����d�l�ɂ��Ă���B
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
	echo ���g���̃V�X�e���� Node.js ���C���X�g�[������Ă��Ȃ����A
	echo Node.js �̎��s�ɕK�v�ȃp�X���ݒ肳��Ă��܂���B
	echo �p�X�̓V�X�e���̊��ϐ����A���̃o�b�`�t�@�C�����Ŏw�肷�邱�Ƃ��ł��܂��B
	echo;
	call :require_node "%NODE_DOWNLOAD_PAGE_URL%"
	
	if "!requiresNode!" == "1" goto :begin_process
	
	goto :end_process
	
)

call %NPM% -version > nul 2>&1

if errorlevel 1 (
	
	echo;
	echo ���g���̃V�X�e���� NPM ���C���X�g�[������Ă��Ȃ����A
	echo NPM �̎��s�ɕK�v�ȃp�X���ݒ肳��Ă��܂���B
	echo Node.js �̃C���X�g�[�����s�\���ł���\��������܂��B
	echo;
	call :require_node "%NODE_DOWNLOAD_PAGE_URL%"
	
	if "!requiresNode!" == "1" goto :begin_process
	
	goto :end_process
	
)

if "%~1" == "" (
	
	set option=
	
	echo;
	echo [�C���X�g�[���I�v�V���������: �w���v��\��=h]
	set /p option=^>
	echo;
	
) else (
	
	set option=%~1
	
	goto fetch_args
	
)

:fetched_args

if "%option%" == "h" (
	
	echo �ȉ��͊���ŃC���X�g�[������郂�W���[���ł��B
	echo;
	
	call :view_module_list "%DEFAULT_INSTALL_MODULES%"
	echo;
	
	echo �C���X�g�[����͈ȉ��ł��B
	echo;
	echo   "%appdata%\npm\node_modules\"
	echo;
	echo ���ɃC���X�g�[������Ă���ꍇ�A�㏑���C���X�g�[������܂��B
	echo �ȉ��̃C���X�g�[���I�v�V��������͂ł��܂��B
	echo �����͂̏ꍇ�A��L�̃��W���[���������C���X�g�[�����܂��B
	echo;
	echo     --i module0 module1 module2...
	echo   ����ŃC���X�g�[�����郂�W���[���ɉ����A�񋓂������W���[�����C���X�g�[������
	echo;
	echo     --x
	echo   ����̃��W���[���̃C���X�g�[�������ׂăX�L�b�v
	echo;
	echo     --x module0 module1 module2...
	echo   �񋓂������W���[���̃C���X�g�[���̃X�L�b�v
	echo;
	echo     --xx
	echo   ����̃��W���[���̃C���X�g�[�������ׂăX�L�b�v�B
	echo   --x �Ɠ����w�肪�\�ł��B
	echo;
	echo     --xx module0 module1 module2...
	echo   �񋓂������W���[���Ɗ���̃��W���[���̃C���X�g�[�������ׂăX�L�b�v�B
	echo   --x �Ɠ����w�肪�\�ł��B
	echo;
	echo     --u
	echo   --i �Ɏw�肳�ꂽ���W���[�����A���C���X�g�[�����܂��B
	echo   --u �������w�肵���ꍇ�A
	echo   ����ŃC���X�g�[�����ꂽ���W���[�����A���C���X�g�[�����܂��B
	echo   --x ���w�肵�Ă���ƁA�񋓂������W���[���̃A���C���X�g�[�����X�L�b�v���܂��B
	
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
	set processName=�A���C���X�g�[��
) else (
	set process=i
	set processName=�C���X�g�[��
)

set modules=%modules:~5%

if defined modules (
	
	echo �ȉ��̃��W���[����!processName!����܂��B
	echo;
	
	call :view_module_list "%modules%"
	
	echo;
	echo ��낵����� y ����͂��Ă��������B
	echo �����͂��A����ȊO����͂���ƁA!processName!�𒆎~���ďI�����܂��B
	echo;
	echo [��L�̃��W���[����!processName!����=y]
	set /p confirm=^>
	echo;
	
	if /i not "!confirm!" == "y" endlocal&exit
	
	call %NPM% !process! -g%modules%
	
)

:create_setup_file

if exist "!SETUP_BAT_OUTPUT_PATH!" (
	
	echo ���ꂩ��쐬����Z�b�g�A�b�v�p�̃t�@�C�� "!SETUP_BAT_OUTPUT_PATH!" ��
	echo �����̃t�@�C�������ɑ��݂��܂��B
	echo;
	echo [�㏑������=������, �ʂ̖��O�ŐV�K�쐬����=�C�ӂ̖��O]
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

echo �Z�b�g�A�b�v�p�̃t�@�C�� "!SETUP_BAT_OUTPUT_PATH!" ���쐬���܂����B
echo �v���W�F�N�g��V�K�쐬����ۂ́A���̓s�x
echo �v���W�F�N�g�̃��[�g�t�H���_�[�ɂ��̃t�@�C�����R�s�[���Ď��s���Ă��������B
echo;

:end_process

echo �C���X�g�[�����I�����܂��B�C�ӂ̃L�[�������Ă��������B

endlocal
pause>nul
exit

:view_module_list

set values=console.log('%~1'.replace(/\s/g, '\n'));

for /f %%i in ('call %NODE% -e "%values%"') do echo   %%i

exit /b

:require_node

echo [����̃u���E�U�[�� Node.js �̃_�E�����[�h�y�[�W���J��=y]
set /p openNodeDLPage=^>

if /i "!openNodeDLPage!" == "y" start "" %1

echo;
echo [���̃o�b�`�t�@�C�����Ď��s����=y]
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