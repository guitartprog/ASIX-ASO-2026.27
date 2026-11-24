
param(
    [string]$fitxer = "C:\Users\Administrador\Scripts\Dades\uo_a_crear.csv"
)

Import-Module ActiveDirectory

$logs = "C:\Users\Administrador\Scripts\Logs\crear_ou_multiples_fitxer"
$ruta_per_defecte = "OU=UO_MusicCloud,DC=musiccloud,DC=local"

# Crear carpeta i fitxers de logs
New-Item -ItemType Directory -Path $logs -Force | Out-Null

foreach ($ext in @("log", "warn", "err")) {
    $fitxer_log = Join-Path $logs "crear_ou.$ext"
    if (-not (Test-Path $fitxer_log)) {
        New-Item -ItemType File -Path $fitxer_log | Out-Null
    }
}

# Funcio per registrar missatges
function registrar_log($nivell, $missatge) {
    $data = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    switch ($nivell) {
        "INFO" { "$data [INFO] $missatge" | Out-File "$logs\crear_ou.log" -Append }
        "WARN" { "$data [WARN] $missatge" | Out-File "$logs\crear_ou.warn" -Append }
        "ERR"  { "$data [ERR] $missatge" | Out-File "$logs\crear_ou.err" -Append }
    }
}

# Comprovar que existeix el CSV
if (-not (Test-Path $fitxer)) {
    registrar_log "ERR" "No existeix el fitxer $fitxer"
    exit
}

# Recorrem les OU del CSV
foreach ($fila in (Import-Csv $fitxer)) {

    $nom = $fila.UO
    $ruta = $fila.RUTA

    # Comprovar la ruta
    if (-not (Get-ADOrganizationalUnit -Identity $ruta -ErrorAction SilentlyContinue)) {
        registrar_log "WARN" "La ruta $ruta no existeix. S'utilitza la ruta per defecte."
        $ruta = $ruta_per_defecte
    }

    # Comprovar si l'OU ja existeix
    if (Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction SilentlyContinue) {
        registrar_log "WARN" "L'OU $nom ja existeix."
    }
    else {
        try {
            New-ADOrganizationalUnit -Name $nom -Path $ruta -ErrorAction Stop
            registrar_log "INFO" "OU $nom creada a $ruta"
        }
        catch {
            registrar_log "ERR" "$_"
        }
    }
}

registrar_log "INFO" "Final de l'execució"

