# List all computers in Active Directory that have been inactive for the last 30 days

Import-Module ActiveDirectory

$daysInactive = 30
$time = (Get-Date).AddDays(-$daysInactive)

Get-ADComputer -Filter * -Properties LastLogonDate |
    Where-Object { $_.LastLogonDate -lt $time -or -not $_.LastLogonDate } |
    Select-Object Name, LastLogonDate |
    Export-Csv -Path "InactiveComputers.csv" -NoTypeInformation

Write-Host "Inactive computers exported to InactiveComputers.csv"