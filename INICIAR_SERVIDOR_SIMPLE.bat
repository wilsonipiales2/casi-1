@echo off
cls
echo ============================================
echo  INICIANDO SISTEMA EN LOCALHOST
echo ============================================
echo.

cd /d %~dp0

echo [1] Verificando Node.js portable...
if not exist "nodejs-portable\node.exe" (
    echo ERROR: Node.js portable no encontrado
    pause
    exit /b 1
)

echo [OK] Node.js encontrado
nodejs-portable\node.exe --version
echo.

echo [2] Verificando dependencias...
if not exist "node_modules\" (
    echo Instalando dependencias (esto puede tardar)...
    nodejs-portable\node.exe nodejs-portable\node_modules\npm\bin\npm-cli.js install
    if errorlevel 1 (
        echo ERROR: Fallo al instalar dependencias
        pause
        exit /b 1
    )
    echo [OK] Dependencias instaladas
)

echo.
echo [3] Iniciando servidor de desarrollo...
echo.
echo URL: http://localhost:5173
echo.
echo Presiona Ctrl+C para detener
echo.

nodejs-portable\node.exe nodejs-portable\node_modules\npm\bin\npm-cli.js run dev

pause
