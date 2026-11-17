
Import-Module ActiveDirectory

# Crear l'OU principal
New-ADOrganizationalUnit -Name "MusicCloud" -Path "DC=musiccloud,DC=local"

# Crear les OUs descendents
New-ADOrganizationalUnit -Name "Usuaris" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
New-ADOrganizationalUnit -Name "Equips" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
New-ADOrganizationalUnit -Name "Grups" -Path "OU=MusicCloud,DC=musiccloud,DC=local"
