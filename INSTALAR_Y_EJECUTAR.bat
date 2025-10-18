@echo off
echo ================================================
echo  INSTALANDO NODE.JS E INICIANDO SERVIDOR
echo ================================================
echo.

REM Intentar instalar con winget
echo [1/3] Intentando instalar Node.js...
winget install -e --id OpenJS.NodeJS.LTS --silent
if errorlevel 1 (
    echo.
    echo ERROR: No se pudo instalar automaticamente
    echo.
    echo Por favor:
    echo 1. Ve a https://nodejs.org/
    echo 2. Descarga e instala Node.js
    echo 3. Vuelve a ejecutar este archivo
    echo.
    pause
    exit /b 1
)

echo.
echo [2/3] Node.js instalado. Actualizando PATH...
echo IMPORTANTE: Cierra y reabre esta ventana despues de este paso
pause

REM Refrescar PATH
call refreshenv

echo.
echo [3/3] Instalando dependencias...
cd /d %~dp0
npm install

echo.
echo Iniciando servidor...
npm run dev

pause
