@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~dp0
@SET XDG_CACHE_HOME=%~dp0\.cache

:: Delete temporary file...
@IF EXIST "%~dp0youtube-dl.exe.new" DEL "%~dp0youtube-dl.exe.new"

:: Call main program in script's directory...
@"%~dp0youtube-dl.exe" -U

:: Check if temporary file is present. If so, new version was 
:: downloaded but EXE file was not replaced due to some bug 
:: in youtube-dl. Replace it here...
@IF EXIST "%~dp0youtube-dl.exe.new" MOVE /Y "%~dp0youtube-dl.exe.new" "%~dp0youtube-dl.exe"

:: Generate usage in text file...
@"%~dp0youtube-dl.exe" --help > "%~dp0youtube-dl.txt"
