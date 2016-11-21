@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url
  @GOTO :EOF
)

@CALL "%~d0%~p0youtube-dl-np-c9.bat" "%~1"
@CALL "%~d0%~p0youtube-dl-np-c5.bat" "%~1"
@CALL "%~d0%~p0youtube-dl-np-c0.bat" "%~1"
