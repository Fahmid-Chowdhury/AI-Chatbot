@echo off
rem Store the directory of the batch file
set "currentDir=%~dp0"
echo Current Directory: %currentDir%

:: Define the folder name
set "NEW_FOLDER=%currentDir%AI-Chatbot"

:: Clone the repository
echo Do you want to proceed with cloning the repository? (Y/N)

choice /C YN /M "Press Y to proceed or N to exit"

rem Check the choice made by the user
if errorlevel 2 (
    echo Download aborted by the user.
    pause
    exit /b 0
) else if errorlevel 1 (
    echo Cloning Repository...
    git clone https://github.com/Fahmid-Chowdhury/AI-Chatbot.git "%NEW_FOLDER%"
    echo Repository cloned successfully.
    pause
)

rem Pause to keep the window open
pause

