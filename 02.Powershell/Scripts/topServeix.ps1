
# Obtenir tots els processos i ordenar-los pel consum de CPU
$processos = Get-Process | Sort-Object CPU -Descending

# Seleccionar els 10 processos amb més consum de CPU
$topProcessos = $processos | Select-Object -First 10 Name, Id, CPU

# Comptar tots els processos del sistema
$totalProcessos = $processos.Count

# Mostrar els resultats
$topProcessos

Write-Host ""
Write-Host "Nombre total de processos: $totalProcessos"
