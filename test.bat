@REM ollama run llama3
@REM exit
@REM pause


@REM @echo off
@REM echo Current Directory: %~dp0
@REM set "currentDir=%~dp0"
@REM cd /d "%currentDir%frontend"
@REM pause
@REM echo Changed Directory: "%currentDir%frontend"
@REM pause

@REM @echo off
@REM rem Store the directory of the batch file
@REM set "currentDir=%~dp0"
@REM echo Current Directory: %currentDir%

@REM rem Change to a specific folder within the current directory
@REM cd /d "%currentDir%SubFolderName"
@REM echo Changed directory to: %currentDir%SubFolderName

@REM pause


@REM @echo off
@REM set "currentDir=%~dp0"
@REM echo Current Directory: %currentDir%
@REM pause


@REM @echo off
@REM echo User Profile Directory: %USERPROFILE%
@REM cd "%USERPROFILE%\AppData\Local\Programs\Ollama"
@REM echo "%USERPROFILE%\AppData\Local\Programs\Ollama"
@REM pause


@REM @echo off
@REM echo User Profile Directory: %USERPROFILE%
@REM if exist "%USERPROFILE%\AppData\Local\Programs\Ollama" (
@REM     cd "%USERPROFILE%\AppData\Local\Programs\Ollama"
@REM     echo Successfully changed directory to Ollama.
@REM ) else (
@REM     echo Directory does not exist: %USERPROFILE%\AppData\Local\Programs\Ollama
@REM )
@REM pause


@REM @echo off
@REM set "fullpath=%USERPROFILE%"
@REM for %%i in ("%fullpath%") do set "username=%%~nxi"
@REM echo User Folder Name: %username%
@REM pause