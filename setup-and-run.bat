@echo off
setlocal

:: Main script
echo Starting setup...

pause

:: Function to check if Node.js is installed
:check_node
powershell -Command "Get-Command node -ErrorAction SilentlyContinue" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Installing Node.js...
    curl -o nodejs.msi https://nodejs.org/dist/v14.17.0/node-v14.17.0-x64.msi
    if %ERRORLEVEL% NEQ 0 (
        echo Error downloading Node.js.
        exit /b 1
    )
    msiexec /i nodejs.msi /quiet /norestart
    if %ERRORLEVEL% NEQ 0 (
        echo Error installing Node.js.
        del nodejs.msi
        exit /b 1
    )
    del nodejs.msi
    echo Node.js installed successfully.
) else (
    echo Node.js is already installed.
)

:: Function to check if Ollama is installed
:check_ollama
powershell -Command "Get-Command ollama -ErrorAction SilentlyContinue" >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Installing ollama...
    :: Download the ollama setup .exe file
    curl -L -o OllamaSetup.exe https://ollama.com/download/OllamaSetup.exe
    if %ERRORLEVEL% NEQ 0 (
        echo Error downloading Ollama setup file.
        exit /b 1
    )
    :: Run the setup file silently (assuming the setup supports silent installation)
    start /wait OllamaSetup.exe /S
    if %ERRORLEVEL% NEQ 0 (
        echo Error installing Ollama.
        del OllamaSetup.exe
        exit /b 1
    )
    :: Cleanup
    del OllamaSetup.exe
    echo Ollama installed successfully.
) else (
    echo Ollama is already installed.
)

:: Function to install npm packages
:install_npm_packages
echo Installing npm packages...
npm install
if %ERRORLEVEL% NEQ 0 (
    echo Error installing npm packages in root directory.
    exit /b 1
)
cd frontend
npm install
if %ERRORLEVEL% NEQ 0 (
    echo Error installing npm packages in frontend directory.
    cd ..
    exit /b 1
)
cd ..

echo Setup completed successfully.

echo Do you want to start the AIChatbot application: (Y/N)
choice /M "Press Y to proceed or N to exit"

:: Check the user's response
if %ERRORLEVEL% EQU 2 (
    echo Installation aborted by the user.
    exit /b 0
) else (
    if %ERRORLEVEL% EQU 1 (
        echo Starting AIChatbot...
        call AIChatbot.bat
    ) else (
        echo Invalid choice. Exiting setup.
        exit /b 1
    )
)

pause

goto:eof
