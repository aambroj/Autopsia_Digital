param(
  [Parameter(Mandatory=$false)]
  [string]$Mensaje = "Actualizar web Autopsia Digital"
)

$ErrorActionPreference = "Stop"

$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo

Write-Host ""
Write-Host "Repositorio:" -ForegroundColor Cyan
Write-Host $repo

Write-Host ""
Write-Host "Estado actual de Git:" -ForegroundColor Cyan
git status --short

$verificador = Join-Path $repo "scripts\verificar-web.ps1"
if (Test-Path $verificador) {
  Write-Host ""
  Write-Host "Ejecutando verificador local..." -ForegroundColor Cyan
  & $verificador
  if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "El verificador ha devuelto avisos o errores. Revisa la salida anterior." -ForegroundColor Yellow
    Write-Host "No se cancela automaticamente porque puede haber avisos no criticos." -ForegroundColor Yellow
  }
}

$changes = git status --short

if ([string]::IsNullOrWhiteSpace($changes)) {
  Write-Host ""
  Write-Host "No hay cambios pendientes para publicar." -ForegroundColor Green
  exit 0
}

Write-Host ""
Write-Host "Cambios que se van a publicar:" -ForegroundColor Cyan
Write-Host $changes

git add .
git commit -m $Mensaje
git push

Write-Host ""
Write-Host "PUBLICACION COMPLETADA" -ForegroundColor Green
Write-Host "Mensaje: $Mensaje" -ForegroundColor Green
