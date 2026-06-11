param(
  [Parameter(Mandatory=$true)]
  [string]$NombreProducto,

  [Parameter(Mandatory=$false)]
  [string]$Cliente = "CLIENTE_PENDIENTE",

  [Parameter(Mandatory=$false)]
  [string]$Plan = "Express"
)

$ErrorActionPreference = "Stop"

$fecha = Get-Date -Format "yyyyMMdd"
$slug = $NombreProducto.ToLower()
$slug = $slug -replace '[^a-z0-9]+', '-'
$slug = $slug.Trim('-')

if ([string]::IsNullOrWhiteSpace($slug)) {
  $slug = "producto"
}

$base = Join-Path (Get-Location) "_clientes_privado"
$caso = Join-Path $base "$fecha-$slug"

New-Item -ItemType Directory -Force -Path $caso | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caso "01_entrada") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caso "02_analisis") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caso "03_informe") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caso "04_entrega") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caso "05_feedback") | Out-Null

$contenido = @"
# Caso Autopsia Digital

Producto: $NombreProducto
Cliente: $Cliente
Plan: $Plan
Fecha: $(Get-Date -Format "yyyy-MM-dd HH:mm")
Estado: Abierto

## Problema principal

Pendiente.

## Decision que necesita tomar

Relanzar / Pivotar / Pausar / Cerrar

## Checklist

- [ ] Informacion recibida
- [ ] Cuestionario completo
- [ ] Plan confirmado
- [ ] Analisis iniciado
- [ ] Score calculado
- [ ] Informe redactado
- [ ] Informe entregado
- [ ] Feedback solicitado
"@

$contenido | Set-Content -Path (Join-Path $caso "README_CASO.md") -Encoding UTF8

$score = @"
# Autopsia Digital Score

| Area | Puntuacion 0-5 | Comentario |
|---|---:|---|
| Claridad |  |  |
| Publico objetivo |  |  |
| Dolor real |  |  |
| Diferenciacion |  |  |
| Confianza |  |  |
| Oferta |  |  |
| Conversion |  |  |
| Viabilidad |  |  |

Total: /40

Veredicto: Pendiente
"@

$score | Set-Content -Path (Join-Path $caso "02_analisis\score.md") -Encoding UTF8

Write-Host ""
Write-Host "CASO CREADO:" -ForegroundColor Green
Write-Host $caso -ForegroundColor Cyan
Write-Host ""
Write-Host "Esta carpeta esta ignorada por Git y no se subira al repositorio."
Write-Host ""

Start-Process $caso
