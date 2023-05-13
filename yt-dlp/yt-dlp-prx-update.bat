@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~dp0
@SET XDG_CACHE_HOME=%~dp0\.cache

:: Delete temporary file...
@IF EXIST "%~dp0yt-dlp.exe.new" DEL "%~dp0yt-dlp.exe.new"

:: Call main program in script's directory...
@"%~dp0yt-dlp.exe" -U

:: Check if temporary file is present. If so, new version was 
:: downloaded but EXE file was not replaced due to some bug 
:: in yt-dlp. Replace it here...
@IF EXIST "%~dp0yt-dlp.exe.new" MOVE /Y "%~dp0yt-dlp.exe.new" "%~dp0yt-dlp.exe"

:: Generate usage in text file...
@"%~dp0yt-dlp.exe" --help > "%~dp0yt-dlp.txt"
