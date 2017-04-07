@SETLOCAL

:: Show usage if no URLs provided...
@IF "%~1"=="" (
  @ECHO Usage: %~n0%~x0 video-or-playlist-url [video-or-playlist-url [...]]
  @GOTO :EOF
)

:: Set HOME to script's dir...
@SET HOME=%~d0%~p0
@SET XDG_CACHE_HOME=%~d0%~p0\.cache

:: Set PATH to ffmpeg and AtomicParsley subfolders if they are present 
:: and there are ffmpeg.exe and AtomicParsley.exe there...
@SET TEST_PATH=%HOME%ffmpeg\bin
@IF EXIST "%TEST_PATH%\ffmpeg.exe" SET PATH=%TEST_PATH%;%PATH%

@SET TEST_PATH=%HOME%AtomicParsley
@IF EXIST "%TEST_PATH%\AtomicParsley.exe" SET PATH=%TEST_PATH%;%PATH%

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

@SET PARAMS=%PARAMS% --console-title

:: Don't stop if program is unable to import thumbnail...
@SET PARAMS=%PARAMS% --ignore-errors

:: Set timeout to 180 sec...
@SET PARAMS=%PARAMS% --socket-timeout 180

:: Rare options...
::@SET PARAMS=%PARAMS% --write-description
::@SET PARAMS=%PARAMS% --write-info-json
::@SET PARAMS=%PARAMS% --write-annotations

:: Call main program in script's directory...
@"%~d0%~p0youtube-dl.exe" --proxy "" --format bestaudio/best --extract-audio %PARAMS% %*
