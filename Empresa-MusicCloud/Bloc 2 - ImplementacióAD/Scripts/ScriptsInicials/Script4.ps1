#Enunciat: Modifiqueu el script anterior perquè el ordre dels arguments no sigui importantç


param(
    [string]$Nom,
    [string]$Ruta
)

Import-Module ActiveDirectory

# Crear la OU
New-ADOrganizationalUnit -Name $Nom -Path $Ruta


#Exemple execució: .\Script4.ps1 -Nom "Administracio" -Ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"
