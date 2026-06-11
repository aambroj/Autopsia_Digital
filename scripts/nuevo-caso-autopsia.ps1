param(
  [Parameter(Mandatory=$true)]
  [string]$NombreProducto,

  [Parameter(Mandatory=$false)]
  [string]$Cliente = "CLIENTE_PENDIENTE",

  [Parameter(Mandatory=$false)]
  [ValidateSet("Express", "Completa", "Premium-Mercado")]
  [string]$Plan = "Express"
)

$ErrorActionPreference = "Stop"

function Convert-ToSlug {
  param([string]$Text)

  $normalized = $Text.ToLowerInvariant()
  $normalized = $normalized -replace '[áàäâ]', 'a'
  $normalized = $normalized -replace '[éèëê]', 'e'
  $normalized = $normalized -replace '[íìïî]', 'i'
  $normalized = $normalized -replace '[óòöô]', 'o'
  $normalized = $normalized -replace '[úùüû]', 'u'
  $normalized = $normalized -replace 'ñ', 'n'
  $normalized = $normalized -replace '[^a-z0-9]+', '-'
  $normalized = $normalized.Trim('-')

  if ([string]::IsNullOrWhiteSpace($normalized)) {
    return "producto"
  }

  return $normalized
}

$baseDir = Join-Path (Get-Location) "_clientes_privado"
$date = Get-Date -Format "yyyyMMdd"
$slug = Convert-ToSlug $NombreProducto
$caseDir = Join-Path $baseDir "$date-$slug"

New-Item -ItemType Directory -Force -Path $caseDir | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caseDir "01_entrada") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caseDir "02_analisis") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caseDir "03_informe") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caseDir "04_entrega") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $caseDir "05_feedback") | Out-Null

$readme = @"
# Caso Autopsia Digital

## Datos básicos

**Producto:** $NombreProducto  
**Cliente:** $Cliente  
**Plan:** $Plan  
**Fecha de apertura:** $(Get-Date -Format "yyyy-MM-dd HH:mm")  
**Estado:** Abierto  

---

## URLs y material recibido

- URL:
- Demo:
- Capturas:
- Documentos:

---

## Problema principal declarado

Pendiente de completar.

---

## Decisión que necesita tomar

- Relanzar.
- Pivotar / Reposicionar.
- Pausar.
- Cerrar.

---

## Notas internas

Pendiente de completar.

---

## Checklist

- [ ] Información inicial recibida.
- [ ] Cuestionario completo.
- [ ] Plan confirmado.
- [ ] Pago/acuerdo confirmado.
- [ ] Análisis iniciado.
- [ ] Autopsia Digital Score calculado.
- [ ] Informe redactado.
- [ ] Informe revisado.
- [ ] Entrega realizada.
- [ ] Feedback solicitado.
"@

$readme | Set-Content -Path (Join-Path $caseDir "README_CASO.md") -Encoding UTF8

$score = @"
# Autopsia Digital Score

| Área | Puntuación 0-5 | Comentario |
|---|---:|---|
| Claridad |  |  |
| Público objetivo |  |  |
| Dolor real |  |  |
| Diferenciación |  |  |
| Confianza |  |  |
| Oferta |  |  |
| Conversión |  |  |
| Viabilidad |  |  |

**Total:** /40

## Interpretación

- 0-15: Riesgo crítico.
- 16-24: Riesgo alto.
- 25-32: Riesgo medio.
- 33-40: Buen potencial.

## Veredicto

Pendiente de completar.
"@

$score | Set-Content -Path (Join-Path $caseDir "02_analisis\score.md") -Encoding UTF8

$templateSource = Join-Path (Get-Location) "docs\plantilla-informe-final-autopsia-digital.md"
$templateDest = Join-Path $caseDir "03_informe\informe-final-borrador.md"

if (Test-Path $templateSource) {
  Copy-Item $templateSource $templateDest -Force
} else {
  "# Informe final`n`nPendiente de completar." | Set-Content -Path $templateDest -Encoding UTF8
}

Write-Host ""
Write-Host "CASO CREADO CORRECTAMENTE" -ForegroundColor Green
Write-Host "Ruta: $caseDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "IMPORTANTE: la carpeta _clientes_privado esta ignorada por Git y no se subira al repositorio."
Write-Host ""

Start-Process $caseDir
