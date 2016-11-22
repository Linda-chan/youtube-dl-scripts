@SETLOCAL
@SET HOME=%~d0%~p0
@SET PATH=%HOME%ffmpeg\bin;%PATH%

@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url
  @GOTO :EOF
)

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

:: Test options...
::@SET PARAMS=%PARAMS% --dump-user-agent
::@SET PARAMS=%PARAMS% --include-ads

:: Rare options...
::@SET PARAMS=%PARAMS% --write-description
::@SET PARAMS=%PARAMS% --write-info-json
::@SET PARAMS=%PARAMS% --write-annotations

@"%~d0%~p0youtube-dl.exe" "%~1" --proxy "" --format best %PARAMS%
