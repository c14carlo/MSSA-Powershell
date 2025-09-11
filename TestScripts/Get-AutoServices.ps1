# Get-AutoServices.ps1
# Lists all Windows services set to start automatically

Get-Service | Where-Object { $_.StartType -eq 'Automatic' } | Select-Object Name, DisplayName, Status | Format-Table -AutoSize