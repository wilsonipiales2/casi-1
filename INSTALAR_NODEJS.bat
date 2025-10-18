@echo off
echo ========================================
echo INSTALADOR DE NODE.JS
echo Marcia Guerron - Coach y Mentora
echo ========================================
echo.

REM Intentar usar winget (Windows 11/10)
where winget >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] Instalando Node.js con winget...
    winget install -e --id OpenJS.NodeJS.LTS --silent
    if %errorlevel% equ 0 (
        echo.
        echo [OK] Node.js instalado correctamente
        echo.
        echo [INFO] Por favor CIERRA esta ventana y abre una NUEVA terminal
        echo Luego ejecuta: INICIAR_PROYECTO.bat
        echo.
        pause
        exit /b 0
    )
)

REM Si winget falla o no existe, usar chocolatey
where choco >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] Instalando Node.js con chocolatey...
    choco install nodejs-lts -y
    if %errorlevel% equ 0 (
        echo.
        echo [OK] Node.js instalado correctamente
        echo.
        echo [INFO] Por favor CIERRA esta ventana y abre una NUEVA terminal
        echo Luego ejecuta: INICIAR_PROYECTO.bat
        echo.
        pause
        exit /b 0
    )
)

REM Si nada funciona, dar instrucciones manuales
echo ========================================
echo INSTALACION MANUAL REQUERIDA
echo ========================================
echo.
echo Node.js no se pudo instalar automaticamente.
echo.
echo Por favor sigue estos pasos:
echo.
echo 1. Abre tu navegador
echo 2. Ve a: https://nodejs.org/
echo 3. Descarga la version LTS (recomendada)
echo 4. Ejecuta el instalador
echo 5. Acepta todas las opciones por defecto
echo 6. Una vez instalado, ejecuta: INICIAR_PROYECTO.bat
echo.
echo Presiona cualquier tecla para abrir el sitio de descarga...
pause
start https://nodejs.org/
