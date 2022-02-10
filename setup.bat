@echo off

set pwd=%~dp0

echo setting up environment
echo   Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
	echo Success: Administrative permissions confirmed.
) else (
	echo Failure: Current permissions inadequate.
	if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
)

pushd %pwd%

:: TODO: package up vim in a portable way and install it here
echo   setting up vi
echo @echo off > vi.bat
echo vim.bat %%* >> vi.bat
move vi.bat %systemroot%

:: TODO: download with curl
echo   setting up git
echo @echo off > git.bat
echo %pwd%\PortableGit\cmd\git.exe %%* >> git.bat
move git.bat %systemroot%

:: TODO: download with curl
echo   setting up 7z
echo @echo off > 7z.bat
echo %pwd%\7-ZipPortable\7-ZipPortable.exe %%* >> 7z.bat
move 7z.bat %systemroot%

echo done
popd
pause
