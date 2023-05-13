@SETLOCAL

:: Set HOME to script's dir...
@SET HOME=%~dp0
@SET XDG_CACHE_HOME=%~dp0\.cache

:: Set text file name for easy access...
@SET FILE_NAME=%~dp0youtube-dl-info.txt

:: Clear text file...
@COPY NUL "%FILE_NAME%" > NUL

:: Call main program in script's directory...
@ECHO ===[ User agent ]==================================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~dp0youtube-dl.exe" --dump-user-agent >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

@ECHO ===[ Extractors ]==================================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~dp0youtube-dl.exe" --list-extractors >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

@ECHO ===[ Extractor descriptions ]======================================== >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"
@"%~dp0youtube-dl.exe" --extractor-descriptions >> "%FILE_NAME%"
@ECHO. >> "%FILE_NAME%"

:: All done!
@ECHO Info was saved to: %FILE_NAME%
