@SETLOCAL

@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url
  @GOTO :EOF
)

:: Set HOME to script's dir and PATH to ffmpeg in script's dir...
@SET HOME=%~d0%~p0
@SET PATH=%HOME%ffmpeg\bin;%PATH%

:: Main options...
@SET PARAMS=%PARAMS% --netrc
@SET PARAMS=%PARAMS% --force-ipv4
@SET PARAMS=%PARAMS% --buffer-size 2097152

:: Fanservice options...
@SET PARAMS=%PARAMS% --xattrs
@SET PARAMS=%PARAMS% --add-metadata

@SET PARAMS=%PARAMS% --all-subs
@SET PARAMS=%PARAMS% --embed-subs

@SET PARAMS=%PARAMS% --write-thumbnail
@SET PARAMS=%PARAMS% --embed-thumbnail

:: Rare options...
::@SET PARAMS=%PARAMS% --write-description
::@SET PARAMS=%PARAMS% --write-info-json
::@SET PARAMS=%PARAMS% --write-annotations

@"%~d0%~p0youtube-dl.exe" "%~1" --proxy "" --format best %PARAMS%
