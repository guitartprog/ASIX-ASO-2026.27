#Enunicat: Crear Script Powershell que crei unitats organitzatives amb valors fixes i variables


Import-Module ActiveDirectory

# Variables
$nomOU = "Administracio"
$ubicacio = "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"

# Crear la unitat organitzativa
New-ADOrganizationalUnit -Name $nomOU -Path $ubicacio




