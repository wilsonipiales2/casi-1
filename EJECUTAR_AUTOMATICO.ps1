# Script automatico para ejecutar el sistema sin requerir Node.js instalado
$ErrorActionPreference = "Stop"

Write-Host "Iniciando sistema automaticamente..." -ForegroundColor Cyan

# Configurar rutas
$projectPath = "c:\Users\Usuario\casi-1"
$nodePath = Join-Path $projectPath "nodejs-portable"
$nodeExe = Join-Path $nodePath "node.exe"

# Verificar Node portable
if (-not (Test-Path $nodeExe)) {
    Write-Host "Error: Node.js portable no encontrado" -ForegroundColor Red
    exit 1
}

# Descargar e instalar npm en el Node portable si no existe
$npmPath = Join-Path $nodePath "node_modules\npm"
if (-not (Test-Path $npmPath)) {
    Write-Host "Configurando npm..." -ForegroundColor Yellow
    
    # Descargar npm
    $npmZip = Join-Path $env:TEMP "npm.zip"
    Invoke-WebRequest -Uri "https://registry.npmjs.org/npm/-/npm-10.2.4.tgz" -OutFile $npmZip
    
    # Extraer en node_modules
    $nodeModules = Join-Path $nodePath "node_modules"
    New-Item -ItemType Directory -Force -Path $nodeModules | Out-Null
    
    tar -xzf $npmZip -C $nodeModules
    Move-Item (Join-Path $nodeModules "package") (Join-Path $nodeModules "npm") -Force
    
    Remove-Item $npmZip -Force
}

# Instalar dependencias del proyecto
Write-Host "Instalando dependencias del proyecto..." -ForegroundColor Yellow
Set-Location $projectPath

& $nodeExe (Join-Path $nodePath "node_modules\npm\bin\npm-cli.js") install

# Iniciar servidor
Write-Host "Iniciando servidor en http://localhost:5173" -ForegroundColor Green
& $nodeExe (Join-Path $nodePath "node_modules\npm\bin\npm-cli.js") run dev
