# Ejecutar servidor directamente usando node portable
$ErrorActionPreference = "Continue"

$projectPath = "c:\Users\Usuario\casi-1"
$nodePath = Join-Path $projectPath "nodejs-portable"
$nodeExe = Join-Path $nodePath "node.exe"
$viteExe = Join-Path $projectPath "node_modules\.bin\vite.cmd"

Set-Location $projectPath

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  SISTEMA ABOGADO WILSON" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Verificar node_modules
if (-not (Test-Path "node_modules")) {
    Write-Host "[INFO] Instalando dependencias..." -ForegroundColor Yellow
    & $nodeExe "$nodePath\node_modules\npm\bin\npm-cli.js" install --legacy-peer-deps
}

# Verificar vite
if (-not (Test-Path $viteExe)) {
    Write-Host "[INFO] Instalando Vite..." -ForegroundColor Yellow
    & $nodeExe "$nodePath\node_modules\npm\bin\npm-cli.js" install vite --save-dev
}

Write-Host "[OK] Iniciando servidor Vite..." -ForegroundColor Green
Write-Host ""
Write-Host "URL: http://localhost:5173" -ForegroundColor Cyan
Write-Host ""
Write-Host "Presiona Ctrl+C para detener" -ForegroundColor Yellow
Write-Host ""

# Ejecutar Vite directamente
& $nodeExe "node_modules\vite\bin\vite.js" --host 0.0.0.0
