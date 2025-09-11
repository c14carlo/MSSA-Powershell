# Get logged on users in the domain using PowerShell and Active Directory

Import-Module ActiveDirectory

# Get all computers in the domain
$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

foreach ($computer in $computers) {
    try {
        $sessions = qwinsta /server:$computer 2>$null | Select-String "Active"
        if ($sessions) {
            Write-Host "Logged on users on $computer"
            foreach ($session in $sessions) {
                $parts = $session -split '\s+'
                # Username is usually in the second column
                if ($parts.Length -ge 2) {
                    Write-Host " - $($parts[1])"
                }
            }
        }
    } catch {
        Write-Host "Could not query $computer"
    }
}