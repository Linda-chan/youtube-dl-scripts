@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~d0%~p0
@SET XDG_CACHE_HOME=%~d0%~p0\.cache

:: Set text file name for easy access...
@SET FILE_NAME=%~d0%~p0yt-dlp-info.txt

:: Clear text file...
@COPY NUL "%FILE_NAME%" > NUL

:: Call main program in script's directory...
@ECHO ===[ User agent ]==================================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~d0%~p0yt-dlp.exe" --dump-user-agent >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

@ECHO ===[ Extractors ]==================================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~d0%~p0yt-dlp.exe" --list-extractors >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

@ECHO ===[ Extractor descriptions ]======================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~d0%~p0yt-dlp.exe" --extractor-descriptions >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

:: All done!
@ECHO Info was saved to: %FILE_NAME%
