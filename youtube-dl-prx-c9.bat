@SETLOCAL
@SET HOME=%~d0%~p0
@SET PATH=%HOME%ffmpeg\bin;%PATH%

@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url
  @GOTO :EOF
)

@"%~d0%~p0youtube-dl.exe" "%~1" --format worst --netrc --all-subs --force-ipv4 --xattrs
