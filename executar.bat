@echo off
REM Script batch para executar o Check-upTI.ps1 facilmente
REM Clique duas vezes para executar

setlocal enabledelayedexpansion
cd /d "%~dp0"

REM Verifica se o PowerShell está disponível
where powershell >nul 2>nul
if %errorlevel% neq 0 (
    echo Erro: PowerShell não encontrado no sistema!
    pause
    exit /b 1
)

REM Executa o script PowerShell
echo Executando Check-upTI...
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "Check-upTI.ps1"

if %errorlevel% neq 0 (
    echo.
    echo Erro ao executar o script!
    pause
    exit /b 1
)

echo.
echo Relatório gerado com sucesso!
echo Abrindo a Desktop...
pause
