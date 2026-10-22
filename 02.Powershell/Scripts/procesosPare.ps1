
# Obtenir tots els processos del sistema
$processosSistema = Get-Process

# Recorrer cada procés
foreach ($proces in $processosSistema) {

    Write-Host ""
    Write-Host "============================== $($proces.ProcessName) ($($proces.Id)) =============================="
    Write-Host ""

    # Obtenir els threads del procés
    $threadsProces = $proces.Threads

    # Mostrar el nombre total de threads
    Write-Host "Total threads: $($threadsProces.Count)"
    Write-Host ""

    # Mostrar l'identificador i el temps de CPU de cada thread
    foreach ($thread in $threadsProces) {

        $tempsCPU = $thread.TotalProcessorTime

        Write-Host "ID: $($thread.Id) CPU TIME: $tempsCPU"
    }
}
