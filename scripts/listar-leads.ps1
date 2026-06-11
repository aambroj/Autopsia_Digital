param()

$ErrorActionPreference = "Stop"

$csv = Join-Path (Get-Location) "_clientes_privado\leads.csv"

if (-not (Test-Path $csv)) {
  Write-Host "Todavia no hay leads registrados." -ForegroundColor Yellow
  Write-Host "Crea uno con:"
  Write-Host '.\scripts\nuevo-lead.ps1 -Nombre "Nombre" -Email "email@dominio.com" -Producto "Producto"'
  exit 0
}

$leads = Import-Csv $csv

if (-not $leads) {
  Write-Host "El archivo de leads existe pero esta vacio." -ForegroundColor Yellow
  exit 0
}

Write-Host ""
Write-Host "LEADS REGISTRADOS" -ForegroundColor Cyan
Write-Host ""

$leads | Format-Table fecha,nombre,email,producto,origen,plan,estado,proxima_accion -AutoSize
