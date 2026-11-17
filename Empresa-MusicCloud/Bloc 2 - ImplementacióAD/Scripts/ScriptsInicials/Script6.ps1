#Exemple Modifiqui el script anterior perque funcioni en totes les situacions o sigui sigui idenpotent.


param(
    [Parameter(Mandatory=$true)]
    [string]$Nom,

    [string]$Ruta = "OU=MusicCloud,DC=musiccloud,DC=local"
)

Import-Module ActiveDirectory

# Comprovar si la OU ja existeix
$DN = "OU=$Nom,$Ruta"

if (Get-ADOrganizationalUnit -Identity $DN -ErrorAction SilentlyContinue) {
    Write-Host "La OU ja existeix."
}
else {
    New-ADOrganizationalUnit -Name $Nom -Path $Ruta
    Write-Host "La OU s'ha creat correctament."
}

#Exemple execució: .\Script6.ps1 -Nom "Administracio" -Ruta "OU=Usuaris,OU=MusicCloud,DC=musiccloud,DC=local"