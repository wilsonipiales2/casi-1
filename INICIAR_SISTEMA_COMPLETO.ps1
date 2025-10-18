# Script completo para iniciar el sistema automaticamente
$ErrorActionPreference = "Continue"

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  INICIANDO SISTEMA AUTOMATICAMENTE" -ForegroundColor Cyan  
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Configurar variables
$projectPath = "c:\Users\Usuario\casi-1"
$nodePath = Join-Path $projectPath "nodejs-portable"
$nodeExe = Join-Path $nodePath "node.exe"

Set-Location $projectPath

# Verificar Node portable
if (-not (Test-Path $nodeExe)) {
    Write-Host "[ERROR] Node.js portable no encontrado" -ForegroundColor Red
    Write-Host "Instalando Node.js globalmente..." -ForegroundColor Yellow
    
    # Intentar con winget
    try {
        winget install -e --id OpenJS.NodeJS.LTS --silent
        Write-Host "[OK] Node.js instalado" -ForegroundColor Green
        Write-Host "Por favor reinicia esta ventana" -ForegroundColor Yellow
        pause
        exit
    } catch {
        Write-Host "[INFO] No se pudo instalar automaticamente" -ForegroundColor Yellow
        Write-Host "Descargando instalador..." -ForegroundColor Yellow
        
        $installerPath = Join-Path $env:TEMP "nodejs.msi"
        Invoke-WebRequest -Uri "https://nodejs.org/dist/v20.11.0/node-v20.11.0-x64.msi" -OutFile $installerPath
        
        Write-Host "Ejecutando instalador..." -ForegroundColor Yellow
        Start-Process msiexec.exe -ArgumentList "/i `"$installerPath`" /passive" -Wait
        
        Write-Host "[OK] Instalacion completada" -ForegroundColor Green
        Write-Host "Por favor reinicia esta ventana" -ForegroundColor Yellow
        pause
        exit
    }
}

# Crear npm wrapper
$npmCli = @"
@echo off
"$nodeExe" "$nodePath\node_modules\npm\bin\npm-cli.js" %*
"@

$npmCmd = Join-Path $projectPath "npm-local.cmd"
Set-Content -Path $npmCmd -Value $npmCli

Write-Host "[1/3] Limpiando instalacion previa..." -ForegroundColor Yellow
if (Test-Path "node_modules") {
    Remove-Item -Path "node_modules" -Recurse -Force -ErrorAction SilentlyContinue
}
if (Test-Path "package-lock.json") {
    Remove-Item -Path "package-lock.json" -Force -ErrorAction SilentlyContinue
}

Write-Host "[2/3] Instalando dependencias..." -ForegroundColor Yellow
Write-Host "Esto puede tardar 5-10 minutos..." -ForegroundColor Gray

& $nodeExe "$nodePath\node_modules\npm\bin\npm-cli.js" install --legacy-peer-deps --no-optional

if ($LASTEXITCODE -ne 0) {
    Write-Host "[WARN] Algunas dependencias fallaron, continuando..." -ForegroundColor Yellow
}

Write-Host "[3/3] Iniciando servidor de desarrollo..." -ForegroundColor Yellow
Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  SERVIDOR CORRIENDO EN:" -ForegroundColor Green
Write-Host "  http://localhost:5173" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Presiona Ctrl+C para detener" -ForegroundColor Yellow
Write-Host ""

# Iniciar servidor
& $nodeExe "$nodePath\node_modules\npm\bin\npm-cli.js" run dev
