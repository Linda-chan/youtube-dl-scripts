@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~d0%~p0

:: Call main program in script's directory...
@"%~d0%~p0youtube-dl.exe" -U

:: Generate usage in text file...
@"%~d0%~p0youtube-dl.exe" --help > "%~d0%~p0youtube-dl.txt"
