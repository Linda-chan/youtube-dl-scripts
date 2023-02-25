@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~d0%~p0
@SET XDG_CACHE_HOME=%~d0%~p0\.cache

:: Delete temporary file...
@IF EXIST "%~d0%~p0yt-dlp.exe.new" DEL "%~d0%~p0yt-dlp.exe.new"

:: Call main program in script's directory...
@"%~d0%~p0yt-dlp.exe" --proxy "" -U

:: Check if temporary file is present. If so, new version was 
:: downloaded but EXE file was not replaced due to some bug 
:: in yt-dlp. Replace it here...
@IF EXIST "%~d0%~p0yt-dlp.exe.new" MOVE /Y "%~d0%~p0yt-dlp.exe.new" "%~d0%~p0yt-dlp.exe"

:: Generate usage in text file...
@"%~d0%~p0yt-dlp.exe" --help > "%~d0%~p0yt-dlp.txt"
