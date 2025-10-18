# Script para iniciar el servidor, instalando Node.js si es necesario

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INICIANDO SISTEMA EN LOCALHOST" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si Node.js está instalado
$nodeInstalled = $null -ne (Get-Command node -ErrorAction SilentlyContinue)

if (-not $nodeInstalled) {
    Write-Host "[INFO] Node.js no está instalado" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Intentando instalar Node.js con winget..." -ForegroundColor Yellow
    
    try {
        winget install OpenJS.NodeJS.LTS --silent --accept-source-agreements --accept-package-agreements
        
        Write-Host ""
        Write-Host "[OK] Node.js instalado correctamente" -ForegroundColor Green
        Write-Host ""
        Write-Host "IMPORTANTE: Por favor, cierra y vuelve a abrir esta ventana" -ForegroundColor Yellow
        Write-Host "para que Node.js esté disponible en el PATH" -ForegroundColor Yellow
        Write-Host ""
        
        pause
        exit
    } catch {
        Write-Host ""
        Write-Host "[ERROR] No se pudo instalar Node.js automáticamente" -ForegroundColor Red
        Write-Host ""
        Write-Host "Por favor, instala Node.js manualmente desde:" -ForegroundColor Yellow
        Write-Host "https://nodejs.org" -ForegroundColor Cyan
        Write-Host ""
        pause
        exit 1
    }
}

# Node.js está instalado, continuar
Write-Host "[OK] Node.js detectado" -ForegroundColor Green
node --version
Write-Host ""

# Verificar si las dependencias están instaladas
if (-not (Test-Path "node_modules")) {
    Write-Host "[INFO] Instalando dependencias..." -ForegroundColor Yellow
    Write-Host "Esto puede tardar varios minutos..." -ForegroundColor Yellow
    Write-Host ""
    
    npm install
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "[ERROR] Error al instalar dependencias" -ForegroundColor Red
        pause
        exit 1
    }
    
    Write-Host ""
    Write-Host "[OK] Dependencias instaladas correctamente" -ForegroundColor Green
    Write-Host ""
}

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INICIANDO SERVIDOR DE DESARROLLO" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "URL: http://localhost:5173" -ForegroundColor Green
Write-Host ""
Write-Host "Presiona Ctrl+C para detener el servidor" -ForegroundColor Yellow
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Iniciar servidor
npm run dev

pause
