#Enunciat: El nom de la UO ha de ser obligatori i la ruta ha de ser opcional. Si no s'introdueix ruta, s'ha de crear dins de "OU=MusicCloud,DC=musiccloud,DC=local"


param(
    [Parameter(Mandatory=$true)]
    [string]$Nom,

    [string]$Ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

# Crear la OU
New-ADOrganizationalUnit -Name $Nom -Path $Ruta


#Exemple execució: .\Script5.ps1 -Nom "Administracio" -Ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"#