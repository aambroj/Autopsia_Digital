param(
  [Parameter(Mandatory=$true)]
  [string]$Nombre,

  [Parameter(Mandatory=$true)]
  [string]$Email,

  [Parameter(Mandatory=$true)]
  [string]$Producto,

  [Parameter(Mandatory=$false)]
  [string]$Origen = "Email",

  [Parameter(Mandatory=$false)]
  [string]$Plan = "Pendiente",

  [Parameter(Mandatory=$false)]
  [string]$Estado = "Nuevo"
)

$ErrorActionPreference = "Stop"

$base = Join-Path (Get-Location) "_clientes_privado"
$csv = Join-Path $base "leads.csv"

New-Item -ItemType Directory -Force -Path $base | Out-Null

if (-not (Test-Path $csv)) {
  "fecha,nombre,email,producto,origen,plan,estado,proxima_accion" | Set-Content -Path $csv -Encoding UTF8
}

$fecha = Get-Date -Format "yyyy-MM-dd HH:mm"
$linea = '"{0}","{1}","{2}","{3}","{4}","{5}","{6}","Responder email"' -f $fecha,$Nombre,$Email,$Producto,$Origen,$Plan,$Estado

Add-Content -Path $csv -Value $linea -Encoding UTF8

Write-Host ""
Write-Host "LEAD REGISTRADO" -ForegroundColor Green
Write-Host "Nombre: $Nombre" -ForegroundColor Cyan
Write-Host "Email: $Email" -ForegroundColor Cyan
Write-Host "Producto: $Producto" -ForegroundColor Cyan
Write-Host "Archivo: $csv" -ForegroundColor Yellow
Write-Host ""
Write-Host "Este archivo esta dentro de _clientes_privado y no se subira a GitHub."
Write-Host ""
