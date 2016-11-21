@SETLOCAL
@SET HOME=%~d0%~p0

@"%~d0%~p0youtube-dl.exe" -U
@"%~d0%~p0youtube-dl.exe" --help > "%~d0%~p0youtube-dl.txt"
