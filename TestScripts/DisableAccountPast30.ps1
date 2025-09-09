# Disable Active Directory accounts that have been inactive for more than 30 days

Import-Module ActiveDirectory

$daysInactive = 30
$time = (Get-Date).AddDays(-$daysInactive)

# Find enabled user accounts whose last logon was more than 30 days ago
Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -lt $time} -Properties LastLogonDate |
ForEach-Object {
    Disable-ADAccount -Identity $_.DistinguishedName
    Write-Output "Disabled account: $($_.SamAccountName) (Last logon: $($_.LastLogonDate))"
}