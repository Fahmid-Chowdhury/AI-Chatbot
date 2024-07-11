@echo off
setlocal

echo Starting all services...

pause

:: Function to start the backend server
:start_server
echo Starting backend server...
cd K:\Projects\Custom-LLM-using-Ollama
start /b cmd /c "node ollamaApi.js"
if %ERRORLEVEL% NEQ 0 (
    echo Error starting backend server.
    exit /b 1
)
echo Backend server started.

:: Function to start Ollama
:start_ollama
start "" "C:\Users\User\AppData\Local\Programs\Ollama\ollama app.exe"
echo Ollama started.

:: Function to start the frontend server
:start_frontend
echo Starting frontend server...
cd K:\Projects\Custom-LLM-using-Ollama\frontend
start /b cmd /c "npm start"
if %ERRORLEVEL% NEQ 0 (
    echo Error starting frontend server.
    exit /b 1
)
echo Frontend server started.

:: Main script
echo Starting all services...
echo All services started successfully.
pause