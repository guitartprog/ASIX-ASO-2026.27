
Import-Module ActiveDirectory

$base = "OU=MusicCloud,DC=musiccloud,DC=local"

# Obtenir OU de MusicCloud
$ous = Get-ADOrganizationalUnit -SearchBase $base -SearchScope Subtree -Filter *

# Desactivar la protecció OU de dins cap a fora
$ous | Sort-Object { $_.DistinguishedName.Length } -Descending | ForEach-Object {
    Set-ADOrganizationalUnit -Identity $_ -ProtectedFromAccidentalDeletion $false
    Remove-ADOrganizationalUnit -Identity $_ -Confirm:$false
}
