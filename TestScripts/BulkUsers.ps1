# BulkUsers.ps1
# Script to create bulk users in Active Directory from a CSV file

Import-Module ActiveDirectory

# Path to CSV file containing user details
$csvPath = "C:\Users\Carlo\OneDrive\Documents\GitHub\MSSA-Powershell\TestScripts\BulkUsers.csv"

# Example CSV columns: FirstName,LastName,Username,Password,OU

# Import users from CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    $securePassword = ConvertTo-SecureString $user.Password -AsPlainText -Force
    $userPrincipalName = "$($user.Username)@yourdomain.com"
    $name = "$($user.FirstName) $($user.LastName)"

    New-ADUser `
        -Name $name `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $user.Username `
        -UserPrincipalName $userPrincipalName `
        -AccountPassword $securePassword `
        -Path $user.OU `
        -Enabled $true

    Write-Host "Created user: $name"
}