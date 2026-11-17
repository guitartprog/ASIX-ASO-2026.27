#Enunciat: Que el ultim script tinguin nom i Ruta variables


Import-Module ActiveDirectory

# Demanar el nom i la ruta
$nomOU = Read-Host "Introdueix el nom de la OU"
$ruta = Read-Host "Introdueix la ruta on vols crear la OU"

# Crear la OU
New-ADOrganizationalUnit -Name $nomOU -Path $ruta
