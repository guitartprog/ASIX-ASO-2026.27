Write-Host "===== INFORMACIÓ DEL SISTEMA ====="
Write-Host ""

Write-Host "Equip: $env:COMPUTERNAME"
Write-Host "Usuari: $env:USERNAME"
Write-Host "PowerShell: $($PSVersionTable.PSVersion)"
Write-Host "Data: $(Get-Date)"
Write-Host "Directori actual: $(Get-Location)"
