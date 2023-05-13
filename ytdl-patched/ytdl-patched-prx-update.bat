@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~dp0
@SET XDG_CACHE_HOME=%~dp0\.cache

:: Delete temporary file...
@IF EXIST "%~dp0ytdl-patched-red.exe.new" DEL "%~dp0ytdl-patched-red.exe.new"

:: Call main program in script's directory...
@"%~dp0ytdl-patched-red.exe" -U

:: Check if temporary file is present. If so, new version was 
:: downloaded but EXE file was not replaced due to some bug 
:: in ytdl-patched. Replace it here...
@IF EXIST "%~dp0ytdl-patched-red.exe.new" MOVE /Y "%~dp0ytdl-patched-red.exe.new" "%~dp0ytdl-patched-red.exe"

:: Generate usage in text file...
@"%~dp0ytdl-patched-red.exe" --help > "%~dp0ytdl-patched.txt"
