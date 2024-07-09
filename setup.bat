@echo off

:: Function to install Node.js
:install_node
echo Installing Node.js...
curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y nodejs
echo Node.js installed successfully.
goto:eof

:: Function to install ollama
:install_ollama
echo Installing ollama...
:: Download the ollama setup .exe file
curl -L -o OllamaSetup.exe https://github.com/ollama/ollama/releases/download/v0.2.1/OllamaSetup.exe
:: Run the setup file silently (assuming the setup supports silent installation)
start /wait OllamaSetup.exe /S
:: Cleanup
del OllamaSetup.exe
echo Ollama installed successfully.
goto:eof

:: Function to install npm packages
:install_npm_packages
echo Installing npm packages...
npm install
cd frontend
npm install
cd ..
echo Npm packages installed successfully.
goto:eof

:: Function to start ollama with llama3 model
:start_ollama
echo Starting ollama with llama3 model...
start /b cmd /c "ollama run llama3"
echo Ollama started with llama3 model.
goto:eof

:: Main script
echo Starting setup...

:: Install Node.js if not already installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    call :install_node
) else (
    echo Node.js is already installed.
)

:: Install ollama
call :install_ollama

:: Install npm packages
call :install_npm_packages

:: Start ollama with llama3 model
call :start_ollama

echo Setup completed successfully.
pause
