#Enunciat: Crear un script que rebi una ruta i diversos noms d'OU com a paràmetres i les creï en aquella ubicació, només si encara no existeixen.
param(
    [Parameter(Mandatory=$true)]
    [string[]]$noms,

    [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

foreach ($nom in $noms) {

    try {
        $ou = Get-ADOrganizationalUnit -Identity "OU=$nom,$ruta" -ErrorAction Stop
    }
    catch {
        $ou = $null
    }

    if (-not $ou) {
        New-ADOrganizationalUnit -Name $nom -Path $ruta
    }
}

#Exemple execució: .\Script7.ps1 -noms "Usuaris", "Equips", "Grups" -ruta "OU=MusicCloud,DC=musiccloud,DC=local"
