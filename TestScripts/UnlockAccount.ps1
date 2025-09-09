param(
    [Parameter(Mandatory=$true)]
    [string]$Username
)

Import-Module ActiveDirectory

try {
    Unlock-ADAccount -Identity $Username
    Write-Host "Account '$Username' has been unlocked successfully."
} catch {
    Write-Error "Failed to unlock account '$Username'. $_"
}