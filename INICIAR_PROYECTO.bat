@echo off
echo ========================================
echo MARCIA GUERRON - COACH Y MENTORA
echo Iniciando Proyecto...
echo ========================================
echo.

REM Verificar si Node.js esta instalado
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Node.js no esta instalado
    echo.
    echo Por favor instala Node.js desde: https://nodejs.org/
    echo Descarga la version LTS (Long Term Support)
    echo.
    pause
    exit /b 1
)

echo [OK] Node.js instalado
node --version
echo.

REM Verificar si npm esta instalado
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] npm no esta instalado
    pause
    exit /b 1
)

echo [OK] npm instalado
npm --version
echo.

REM Verificar si node_modules existe
if not exist "node_modules\" (
    echo [INFO] Instalando dependencias...
    echo Esto puede tomar unos minutos...
    echo.
    call npm install
    if %errorlevel% neq 0 (
        echo [ERROR] Fallo la instalacion de dependencias
        pause
        exit /b 1
    )
    echo.
    echo [OK] Dependencias instaladas correctamente
    echo.
)

echo ========================================
echo Iniciando servidor de desarrollo...
echo ========================================
echo.
echo El sitio se abrira en: http://localhost:5173
echo.
echo Presiona Ctrl+C para detener el servidor
echo ========================================
echo.

npm run dev

pause
