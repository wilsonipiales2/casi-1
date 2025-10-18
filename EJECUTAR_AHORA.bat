@echo off
echo ========================================
echo MARCIA GUERRON - COACH Y MENTORA
echo Iniciando servidor de desarrollo...
echo ========================================
echo.

REM Agregar Node.js al PATH temporalmente
set "PATH=C:\Program Files\nodejs;%PATH%"

REM Verificar Node.js
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] No se encontro Node.js
    echo Intenta cerrar y abrir una nueva terminal
    pause
    exit /b 1
)

echo [OK] Node.js encontrado
node --version
npm --version
echo.

REM Instalar dependencias si es necesario
if not exist "node_modules\" (
    echo [INFO] Instalando dependencias...
    echo Esto puede tardar unos minutos...
    echo.
    npm install
    echo.
)

echo ========================================
echo Iniciando servidor...
echo ========================================
echo.
echo El sitio se abrira en: http://localhost:5173
echo.
echo Para detener el servidor: Ctrl + C
echo ========================================
echo.

REM Iniciar servidor
npm run dev

pause
