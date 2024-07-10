@REM @echo off
setlocal

:: Function to check if Node.js is installed
:check_node
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    call :install_node
) else (
    echo Node.js is already installed.
)

:: Function to install Node.js
:install_node
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

:: Function to check if Ollama is installed
:check_ollama
where ollama >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    call :install_ollama
) else (
    echo Ollama is already installed.
)

:: Function to install Ollama
:install_ollama
echo Installing Ollama...
:: Run the setup file silently (assuming the setup supports silent installation)
start /wait OllamaSetup.exe /S
if %ERRORLEVEL% NEQ 0 (
    echo Error installing Ollama.
    exit /b 1
)
echo Ollama installed successfully.

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
echo Npm packages installed successfully.

@REM :: Function to start Ollama with llama3 model
@REM :start_ollama
@REM echo Starting Ollama with llama3 model...
@REM start /b cmd /c "ollama run llama3"
@REM if %ERRORLEVEL% NEQ 0 (
@REM     echo Error starting Ollama with llama3 model.
@REM     exit /b 1
@REM )
@REM echo Ollama started with llama3 model.

:: Main script
echo Starting setup...

:: Check and install Node.js if not already installed
call :check_node

:: Check and install Ollama if not already installed
call :check_ollama

:: Install npm packages
call :install_npm_packages

:: Start Ollama with llama3 model
call :start_ollama

echo Setup completed successfully.
pause