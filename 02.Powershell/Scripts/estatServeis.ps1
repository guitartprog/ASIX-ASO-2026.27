
$serveis = Get-Service

$total = $serveis.Count
$executant = ($serveis | Where-Object {$_.Status -eq "Running"}).Count
$noExecutant = $total - $executant

Write-Host "===== ESTAT DELS SERVEIS ====="
Write-Host ""
Write-Host "Total: $total"
Write-Host "Running: $executant"
Write-Host "Not running: $noExecutant"
