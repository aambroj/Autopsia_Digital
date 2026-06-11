param()

$ErrorActionPreference = "Stop"
$ok = $true

function Check-File {
  param([string]$Path)
  if (Test-Path $Path) {
    Write-Host "[OK] $Path" -ForegroundColor Green
  } else {
    Write-Host "[FALTA] $Path" -ForegroundColor Red
    $script:ok = $false
  }
}

function Check-Contains {
  param([string]$Path, [string]$Text)
  if (-not (Test-Path $Path)) {
    Write-Host "[FALTA] $Path" -ForegroundColor Red
    $script:ok = $false
    return
  }
  $content = Get-Content $Path -Raw
  if ($content -match [regex]::Escape($Text)) {
    Write-Host "[OK] $Path contiene $Text" -ForegroundColor Green
  } else {
    Write-Host "[AVISO] $Path no contiene $Text" -ForegroundColor Yellow
    $script:ok = $false
  }
}

Write-Host ""
Write-Host "Verificando archivos principales..." -ForegroundColor Cyan

$files = @(
  "index.html",
  "en/index.html",
  "contacto.html",
  "en/contact.html",
  "contratar.html",
  "en/order.html",
  "muestra.html",
  "en/sample.html",
  "faq.html",
  "en/faq.html",
  "proceso.html",
  "en/process.html",
  "primeros-clientes.html",
  "en/early-access.html",
  "lanzamiento.html",
  "en/launch.html",
  "assets/styles.css",
  "assets/favicon.svg",
  "assets/logo.svg",
  "assets/og-image.svg",
  "sitemap.xml",
  "robots.txt",
  "llms.txt",
  "site.webmanifest",
  ".gitignore",
  "README.md"
)

foreach ($file in $files) {
  Check-File $file
}

Write-Host ""
Write-Host "Verificando contacto y conversion..." -ForegroundColor Cyan

Check-Contains "index.html" "mailto:aambroj@yahoo.es"
Check-Contains "en/index.html" "mailto:aambroj@yahoo.es"
Check-Contains "contacto.html" "aambroj@yahoo.es"
Check-Contains "en/contact.html" "aambroj@yahoo.es"
Check-Contains "sitemap.xml" "contacto.html"
Check-Contains "sitemap.xml" "en/contact.html"
Check-Contains "llms.txt" "Product Autopsy AI"

Write-Host ""
Write-Host "Verificando que la carpeta privada no este controlada por Git..." -ForegroundColor Cyan

$trackedPrivate = git ls-files _clientes_privado 2>$null
if ([string]::IsNullOrWhiteSpace($trackedPrivate)) {
  Write-Host "[OK] _clientes_privado no esta en Git" -ForegroundColor Green
} else {
  Write-Host "[ERROR] _clientes_privado aparece en Git" -ForegroundColor Red
  Write-Host $trackedPrivate
  $ok = $false
}

Write-Host ""
if ($ok) {
  Write-Host "VERIFICACION OK" -ForegroundColor Green
  exit 0
} else {
  Write-Host "VERIFICACION CON AVISOS O ERRORES" -ForegroundColor Yellow
  exit 1
}
