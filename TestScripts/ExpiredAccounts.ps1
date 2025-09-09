# List all expired user accounts in Active Directory

Import-Module ActiveDirectory

Get-ADUser -Filter {AccountExpirationDate -lt (Get-Date) -and AccountExpirationDate -ne $null} -Properties AccountExpirationDate |
Select-Object Name, SamAccountName, AccountExpirationDate
