:: Show usage if no URLs provided...
@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url [...]
  @ECHO        %~n0%~x0 -a list-file-name
  @ECHO        %~n0%~x0 --batch-file list-file-name
  @GOTO :EOF
)

:: Call other BAT files in script's directory...
@CALL "%~d0%~p0yt-dlp-np-c9.bat" %*
@CALL "%~d0%~p0yt-dlp-np-c5.bat" %*
@CALL "%~d0%~p0yt-dlp-np-c0.bat" %*
