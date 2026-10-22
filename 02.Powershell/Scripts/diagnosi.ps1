
# =====================
# PROCESSOS
# =====================

$processos = Get-Process
$processosCPU = $processos |
    Sort-Object CPU -Descending |
    Select-Object -First 5 Name, Id, CPU

Write-Host "===== PROCESSOS AMB MES CPU ====="
$processosCPU

# =====================
# SERVEIS
# =====================

$serveisSistema = Get-Service

$totalServeis = $serveisSistema.Count
$serveisEnExecucio = ($serveisSistema |
    Where-Object { $_.Status -eq "Running" }).Count
$serveisNoExecutats = $totalServeis - $serveisEnExecucio

Write-Host ""
Write-Host "===== ESTAT DELS SERVEIS ====="
Write-Host "Total de serveis: $totalServeis"
Write-Host "Serveis en execucio: $serveisEnExecucio"
Write-Host "Serveis no executats: $serveisNoExecutats"

# =====================
# FITXERS
# =====================

$elementsCarpeta = Get-ChildItem
$fitxersCarpeta = $elementsCarpeta |
    Where-Object { -not $_.PSIsContainer }

$fitxersGrans = $fitxersCarpeta |
    Sort-Object Length -Descending |
    Select-Object -First 3 Name, Length

Write-Host ""
Write-Host "===== ELS 3 FITXERS MES GRANS ====="
$fitxersGrans

# =====================
# RESUM
# =====================

$totalProcessos = $processos.Count
$totalFitxers = $fitxersCarpeta.Count

Write-Host ""
Write-Host "===== RESUM ====="
Write-Host "Processos analitzats: $totalProcessos"
Write-Host "Serveis analitzats: $totalServeis"
Write-Host "Fitxers analitzats: $totalFitxers"
