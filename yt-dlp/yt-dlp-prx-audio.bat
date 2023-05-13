@SETLOCAL

:: Show usage if no URLs provided...
@IF "%~1"=="" (
  @ECHO Usage: %~nx0 video-or-playlist-url [...]
  @ECHO        %~nx0 -a list-file-name
  @ECHO        %~nx0 --batch-file list-file-name
  @GOTO :EOF
)

:: Set HOME to script's dir...
@SET HOME=%~dp0
@SET XDG_CACHE_HOME=%~dp0\.cache

:: Set PATH to ffmpeg and AtomicParsley subfolders if they are present 
:: and there are ffmpeg.exe and AtomicParsley.exe there...
@SET TEST_PATH=%HOME%ffmpeg\bin
@IF EXIST "%TEST_PATH%\ffmpeg.exe" SET PATH=%TEST_PATH%;%PATH%

@SET TEST_PATH=%HOME%AtomicParsley
@IF EXIST "%TEST_PATH%\AtomicParsley.exe" SET PATH=%TEST_PATH%;%PATH%

:: Main options...
@SET PARAMS=%PARAMS% --force-ipv4
@SET PARAMS=%PARAMS% --buffer-size 2097152

:: Fanservice options...
@SET PARAMS=%PARAMS% --xattrs
@SET PARAMS=%PARAMS% --add-metadata
@SET PARAMS=%PARAMS% --embed-chapters

:: Instead of --all-subs from youtube-dl: download all subs except 
:: live chat which leads to errors and unintiresting anyway...
@SET PARAMS=%PARAMS% --sub-langs=all,-live_chat
@SET PARAMS=%PARAMS% --embed-subs

@SET PARAMS=%PARAMS% --write-thumbnail
@SET PARAMS=%PARAMS% --embed-thumbnail

@SET PARAMS=%PARAMS% --console-title

:: Don't stop if program is unable to import thumbnail...
@SET PARAMS=%PARAMS% --ignore-errors

:: Set timeout to 180 sec...
@SET PARAMS=%PARAMS% --socket-timeout 180

:: Mark YouTube videos as watched...
@SET PARAMS=%PARAMS% --mark-watched

:: Custom config file in script's directory...
@IF EXIST "%~dp0yt-dlp.cfg" (
  @SET PARAMS=%PARAMS% --config-location "%~dp0yt-dlp.cfg"
)

:: Rare options...
::@SET PARAMS=%PARAMS% --write-description
::@SET PARAMS=%PARAMS% --write-info-json
::@SET PARAMS=%PARAMS% --write-annotations
::@SET PARAMS=%PARAMS% --write-auto-sub

:: Add support for .netrc file only if it exist.
@IF EXIST "%~dp0.netrc" (
  @SET PARAMS=%PARAMS% --netrc
)

:: Add support for cookies.txt file only if it exist.
@IF EXIST "%~dp0cookies.txt" (
  @SET PARAMS=%PARAMS% --cookies "%~dp0cookies.txt"
)

:: Call main program in script's directory...
@"%~dp0yt-dlp.exe" --format bestaudio/best --extract-audio %PARAMS% %*
