param(
  [string]$IndexPath = "index.html",
  [string]$JsonPath = "structured-data/enlevia.schema.json"
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $JsonPath)) {
  throw "Missing $JsonPath"
}
if (-not (Test-Path $IndexPath)) {
  throw "Missing $IndexPath"
}

$json = Get-Content -Path $JsonPath -Raw
$index = Get-Content -Path $IndexPath -Raw

$replacement = "<script type=`"application/ld+json`">`n$json`n</script>"

if ($index -match '(?s)<script\s+type="application/ld\+json"[^>]*>.*?</script>') {
  $index = [regex]::Replace($index, '(?s)<script\s+type="application/ld\+json"[^>]*>.*?</script>', $replacement, 1)
} else {
  throw 'No JSON-LD script tag found in index.html'
}

Set-Content -Path $IndexPath -Value $index -Encoding utf8
Write-Host "Updated JSON-LD in $IndexPath from $JsonPath"
