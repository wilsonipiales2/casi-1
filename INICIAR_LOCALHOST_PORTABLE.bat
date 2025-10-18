@echo off
chcp 65001 >nul
cls

echo ============================================
echo   🚀 INICIANDO SISTEMA EN LOCALHOST
echo ============================================
echo.

set "NODE_PATH=%~dp0nodejs-portable"
set "NODE_EXE=%NODE_PATH%\node.exe"
set "NPM_EXE=%NODE_PATH%\npm.cmd"

REM Verificar Node portable
if not exist "%NODE_EXE%" (
    echo ❌ ERROR: Node.js portable no encontrado
    echo.
    echo Buscando en: %NODE_EXE%
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js portable encontrado
"%NODE_EXE%" --version
echo.

REM Verificar node_modules
if not exist "node_modules\" (
    echo 📦 Instalando dependencias...
    echo Esto puede tomar varios minutos...
    echo.
    "%NODE_EXE%" "%NODE_PATH%\node_modules\npm\bin\npm-cli.js" install
    if errorlevel 1 (
        echo.
        echo ❌ Error al instalar dependencias
        echo.
        pause
        exit /b 1
    )
    echo.
    echo ✅ Dependencias instaladas correctamente
    echo.
)

echo.
echo ============================================
echo   🌐 INICIANDO SERVIDOR DE DESARROLLO
echo ============================================
echo.
echo 📍 URL: http://localhost:5173
echo.
echo ⚠️  Presiona Ctrl+C para detener el servidor
echo.
echo ============================================
echo.

REM Iniciar servidor Vite
"%NODE_EXE%" "%NODE_PATH%\node_modules\npm\bin\npm-cli.js" run dev

pause
