@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~d0%~p0

:: Delete temporary file...
@IF EXIST "%~d0%~p0youtube-dl.exe.new" DEL "%~d0%~p0youtube-dl.exe.new"

:: Call main program in script's directory...
@"%~d0%~p0youtube-dl.exe" -U

:: Check if temporary file is present. If so, new version was 
:: downloaded but EXE file was not replaced due to some bug 
:: in youtube-dl. Replace it here...
@IF EXIST "%~d0%~p0youtube-dl.exe.new" MOVE /Y "%~d0%~p0youtube-dl.exe.new" "%~d0%~p0youtube-dl.exe"

:: Generate usage in text file...
@"%~d0%~p0youtube-dl.exe" --help > "%~d0%~p0youtube-dl.txt"
