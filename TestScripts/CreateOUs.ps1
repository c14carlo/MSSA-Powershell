# CreateOUs.ps1
# Script to create Organizational Units (OUs) in Active Directory

Import-Module ActiveDirectory

# List of OU names to create
$OUs = @(
    "Sales",
    "Marketing",
    "IT",
    "HR",
    "Finance"
)

# Parent DN (Distinguished Name) where OUs will be created
$ParentDN = "OU=Company,DC=yourdomain,DC=com"

foreach ($OU in $OUs) {
    $OUPath = "OU=$OU,$ParentDN"
    if (-not (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$OUPath'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $OU -Path $ParentDN
        Write-Host "Created OU: $OU"
    } else {
        Write-Host "OU already exists: $OU"
    }
}