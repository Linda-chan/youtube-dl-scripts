:: Show usage if no URLs provided...
@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url
  @GOTO :EOF
)

:: Call other BAT files in script's directory...
@CALL "%~d0%~p0youtube-dl-prx-c9.bat" "%~1"
@CALL "%~d0%~p0youtube-dl-prx-c5.bat" "%~1"
@CALL "%~d0%~p0youtube-dl-prx-c0.bat" "%~1"
