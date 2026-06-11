param(
  [Parameter(Mandatory=$false)]
  [string]$EsExpress = "",

  [Parameter(Mandatory=$false)]
  [string]$EsCompleta = "",

  [Parameter(Mandatory=$false)]
  [string]$EsPremium = "",

  [Parameter(Mandatory=$false)]
  [string]$EnExpress = "",

  [Parameter(Mandatory=$false)]
  [string]$EnFull = "",

  [Parameter(Mandatory=$false)]
  [string]$EnPremium = ""
)

$ErrorActionPreference = "Stop"

function Test-Link {
  param([string]$Name, [string]$Url)

  if ([string]::IsNullOrWhiteSpace($Url)) {
    Write-Host "[AVISO] $Name no configurado. Se mantiene contacto por email." -ForegroundColor Yellow
    return $false
  }

  if ($Url -notmatch "^https://") {
    throw "El enlace $Name debe empezar por https://"
  }

  return $true
}

function Replace-IfPresent {
  param(
    [string]$Path,
    [string]$Search,
    [string]$Replace
  )

  if (-not (Test-Path $Path)) {
    Write-Host "[AVISO] No existe $Path" -ForegroundColor Yellow
    return
  }

  $html = Get-Content $Path -Raw

  if ($html -match [regex]::Escape($Search)) {
    $html = $html.Replace($Search, $Replace)
    Set-Content -Path $Path -Value $html -Encoding UTF8
    Write-Host "[OK] Actualizado $Path" -ForegroundColor Green
  } else {
    Write-Host "[AVISO] No se encontro texto esperado en $Path" -ForegroundColor Yellow
  }
}

$hasEsExpress = Test-Link "ES Express" $EsExpress
$hasEsCompleta = Test-Link "ES Completa" $EsCompleta
$hasEsPremium = Test-Link "ES Premium" $EsPremium
$hasEnExpress = Test-Link "EN Express" $EnExpress
$hasEnFull = Test-Link "EN Full" $EnFull
$hasEnPremium = Test-Link "EN Premium" $EnPremium

if ($hasEsExpress) {
  Replace-IfPresent "pago-seguro.html" '<a class="button" href="contacto.html">Consultar antes de pagar</a>' ('<a class="button" href="' + $EsExpress + '">Pagar Autopsia Express</a>')
}

if ($hasEsCompleta) {
  Replace-IfPresent "pago-seguro.html" '<a class="button" href="contacto.html">Consultar antes de pagar</a>' ('<a class="button" href="' + $EsCompleta + '">Pagar Autopsia Completa</a>')
}

if ($hasEsPremium) {
  Replace-IfPresent "pago-seguro.html" '<a class="button" href="contacto.html">Consultar antes de pagar</a>' ('<a class="button" href="' + $EsPremium + '">Pagar Premium + Mercado</a>')
}

if ($hasEnExpress) {
  Replace-IfPresent "en\secure-payment.html" '<a class="button" href="contact.html">Ask before paying</a>' ('<a class="button" href="' + $EnExpress + '">Pay Express Autopsy</a>')
}

if ($hasEnFull) {
  Replace-IfPresent "en\secure-payment.html" '<a class="button" href="contact.html">Ask before paying</a>' ('<a class="button" href="' + $EnFull + '">Pay Full Autopsy</a>')
}

if ($hasEnPremium) {
  Replace-IfPresent "en\secure-payment.html" '<a class="button" href="contact.html">Ask before paying</a>' ('<a class="button" href="' + $EnPremium + '">Pay Premium + Market</a>')
}

Write-Host ""
Write-Host "Configuracion terminada." -ForegroundColor Green
Write-Host "Revisa pago-seguro.html y en\secure-payment.html antes de publicar." -ForegroundColor Cyan
Write-Host ""
