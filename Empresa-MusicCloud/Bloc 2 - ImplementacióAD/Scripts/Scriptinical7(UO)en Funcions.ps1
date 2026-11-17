#Enunciat: Transformar el script .7 en funcions

Import-Module ActiveDirectory

function Crear-OU {
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$noms,

        [string]$ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
    )

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
}


#Exemple execucio: Crear-OU -noms "Direccio","Administracio","SuportTecnic" -ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

