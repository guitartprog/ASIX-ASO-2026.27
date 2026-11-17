#Enucnat: fer el mateix que el ultim de UO pero amb grups que no siguin de seguretat.

param(
    [Parameter(Mandatory=$true)]
    [string[]]$noms,

    [string]$ruta = "CN=Users,DC=musiccloud,DC=local"
)

function ComprovarGrup($nom, $ruta) {

    $grup = Get-ADGroup `
        -Filter "Name -eq '$nom'" `
        -SearchBase $ruta `
        -ErrorAction SilentlyContinue

    return $grup
}

function CrearGrup($nom, $ruta) {

    New-ADGroup `
        -Name $nom `
        -GroupCategory Distribution `
        -GroupScope Global `
        -Path $ruta
}

function GestionarGrup($nom, $ruta) {

    $grup = ComprovarGrup $nom $ruta

    if (-not $grup) {
        CrearGrup $nom $ruta
    }
}

function CrearGrups($noms, $ruta) {

    foreach ($nom in $noms) {
        GestionarGrup $nom $ruta
    }
}

CrearGrups $noms $ruta

#Exemple: .\Acriptinicial7peroambgrups.ps1 -noms "DepartamentINfomratica","TalTAl","TalTAltal" -ruta "CN=Users,DC=musiccloud,DC=local"
