# Script para instalar Node.js automáticamente
# Requiere ejecutar como Administrador

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INSTALADOR AUTOMÁTICO DE NODE.JS" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar privilegios de administrador
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "[ERROR] Este script requiere permisos de administrador" -ForegroundColor Red
    Write-Host ""
    Write-Host "Haz clic derecho en el archivo y selecciona:" -ForegroundColor Yellow
    Write-Host "'Ejecutar con PowerShell como administrador'" -ForegroundColor Yellow
    Write-Host ""
    pause
    exit 1
}

Write-Host "[INFO] Descargando Node.js LTS..." -ForegroundColor Yellow
$nodeUrl = "https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi"
$installerPath = "$env:TEMP\nodejs-installer.msi"

try {
    Invoke-WebRequest -Uri $nodeUrl -OutFile $installerPath -UseBasicParsing
    Write-Host "[OK] Descarga completada" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "[INFO] Instalando Node.js..." -ForegroundColor Yellow
    Write-Host "Esto puede tardar 2-3 minutos..." -ForegroundColor Yellow
    
    Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /quiet /norestart" -Wait
    
    Write-Host ""
    Write-Host "[OK] Node.js instalado correctamente" -ForegroundColor Green
    Write-Host ""
    
    # Actualizar variables de entorno
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host "  INSTALACIÓN COMPLETADA" -ForegroundColor Green
    Write-Host "============================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "IMPORTANTE: Cierra y vuelve a abrir PowerShell" -ForegroundColor Yellow
    Write-Host "para que los cambios surtan efecto" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Luego ejecuta:" -ForegroundColor Cyan
    Write-Host "  cd c:\Users\Usuario\casi-1" -ForegroundColor White
    Write-Host "  npm install" -ForegroundColor White
    Write-Host "  npm run dev" -ForegroundColor White
    Write-Host ""
    
} catch {
    Write-Host ""
    Write-Host "[ERROR] Error durante la instalación: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Por favor, instala Node.js manualmente desde:" -ForegroundColor Yellow
    Write-Host "https://nodejs.org/" -ForegroundColor Cyan
    Write-Host ""
}

# Limpiar
if (Test-Path $installerPath) {
    Remove-Item $installerPath -Force
}

pause
