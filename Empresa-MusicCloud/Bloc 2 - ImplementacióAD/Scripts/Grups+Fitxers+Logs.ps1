
param(
    [string]$fitxer = "C:\Users\Administrator\Scripts\Dades\grups_a_crear.csv"
)

Import-Module ActiveDirectory

$ruta_grups = "OU=UO_Grups,OU=UO_MusicCloud,DC=musiccloud,DC=local"
$logs = "C:\Users\Administrator\Scripts\Logs\crear_grups"

# Creem la carpeta i els fitxers de logs
New-Item -ItemType Directory -Path $logs -Force | Out-Null

foreach ($ext in @("log", "warn", "err")) {
    $fitxer_log = "$logs\crear_grups.$ext"
    if (-not (Test-Path $fitxer_log)) {
        New-Item -ItemType File -Path $fitxer_log | Out-Null
    }
}

function registrar_log($nivell, $missatge) {
    $data = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    switch ($nivell) {
        "INFO" { "$data [INFO] $missatge" | Out-File "$logs\crear_grups.log" -Append }
        "WARN" { "$data [WARN] $missatge" | Out-File "$logs\crear_grups.warn" -Append }
        "ERR"  { "$data [ERR] $missatge" | Out-File "$logs\crear_grups.err" -Append }
    }
}

# Comprovem que existeix el CSV
if (-not (Test-Path $fitxer)) {
    registrar_log "ERR" "No existeix el fitxer $fitxer"
    exit
}

$dades = Import-Csv $fitxer

# Creem els grups
foreach ($linia in $dades) {
    $nom = $linia.GRUP
    $ruta = $linia.RUTA

    if (-not (Get-ADOrganizationalUnit -Identity $ruta -ErrorAction SilentlyContinue)) {
        registrar_log "WARN" "La ruta $ruta no existeix. S'utilitza la ruta per defecte."
        $ruta = $ruta_grups
    }

    if (Get-ADGroup -Filter "Name -eq '$nom'" -ErrorAction SilentlyContinue) {
        registrar_log "WARN" "El grup $nom ja existeix."
    }
    else {
        try {
            New-ADGroup -Name $nom -GroupScope Global -GroupCategory Security -Path $ruta -ErrorAction Stop
            registrar_log "INFO" "Grup $nom creat correctament."
        }
        catch {
            registrar_log "ERR" "No s'ha pogut crear el grup $nom. $_"
        }
    }
}

# Afegim els membres als grups
foreach ($linia in $dades) {
    if ($linia.MEMBRE) {
        try {
            Add-ADGroupMember -Identity $linia.MEMBRE -Members $linia.GRUP -ErrorAction Stop
            registrar_log "INFO" "S'ha afegit $($linia.GRUP) com a membre de $($linia.MEMBRE)."
        }
        catch {
            registrar_log "ERR" "No s'ha pogut afegir $($linia.GRUP) a $($linia.MEMBRE). $_"
        }
    }
}

registrar_log "INFO" "Final de l'execució."
