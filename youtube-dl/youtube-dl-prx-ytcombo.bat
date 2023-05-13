:: Show usage if no URLs provided...
@IF "%~1"=="" (
  @ECHO Usage: %~nx0 video-or-playlist-url [...]
  @ECHO        %~nx0 -a list-file-name
  @ECHO        %~nx0 --batch-file list-file-name
  @GOTO :EOF
)

:: Call other BAT files in script's directory...
@CALL "%~dp0youtube-dl-prx-c9.bat" %*
@CALL "%~dp0youtube-dl-prx-c5.bat" %*
@CALL "%~dp0youtube-dl-prx-c0.bat" %*
