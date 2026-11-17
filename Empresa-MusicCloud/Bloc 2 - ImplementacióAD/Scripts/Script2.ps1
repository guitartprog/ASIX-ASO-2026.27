#Enunciat: Modificar ultim scrsipt i que crei UO amb nom de dada entrada 
Import-Module ActiveDirectory

$nomOU = Read-Host "Introdueix el nom de la OU"

$ubicacio = "OU=MusicCloud,DC=musiccloud,DC=local"

New-ADOrganizationalUnit -Name $nomOU -Path $ubicacio