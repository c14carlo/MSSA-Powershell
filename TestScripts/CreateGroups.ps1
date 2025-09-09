# CreateGroups.ps1
# This script creates Active Directory groups

Import-Module ActiveDirectory

# Define group names
$groups = @(
    "HR",
    "Finance",
    "IT",
    "Marketing"
)

# Organizational Unit where groups will be created
$ou = "OU=Groups,DC=yourdomain,DC=com"

foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group -GroupScope Global -GroupCategory Security -Path $ou
        Write-Host "Created group: $group"
    } else {
        Write-Host "Group already exists: $group"
    }
}