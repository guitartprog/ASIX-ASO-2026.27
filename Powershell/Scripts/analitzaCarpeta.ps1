
# Obtenir tots els elements de la carpeta actual
$elementsCarpeta = Get-ChildItem

# Comptar el nombre total d'elements
$totalElements = $elementsCarpeta.Count

# Seleccionar els cinc fitxers més grans
$fitxersGrans = $elementsCarpeta |
    Where-Object { -not $_.PSIsContainer } |
    Sort-Object Length -Descending |
    Select-Object -First 5 Name, Length

# Mostrar els resultats
Write-Host "===== ANÀLISI DE LA CARPETA ====="
Write-Host ""
Write-Host "Nombre total d'elements: $totalElements"
Write-Host ""
Write-Host "===== ELS 5 FITXERS MÉS GRANS ====="

$fitxersGrans |
    Select-Object Name, @{Name="Mida (bytes)"; Expression={$_.Length}} |
    Format-Table -AutoSize
