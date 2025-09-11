# Get-ErrorsLast24h.ps1
# Retrieves error events from the last 24 hours from the System and Application event logs

$since = (Get-Date).AddHours(-24)

Get-WinEvent -FilterHashtable @{
    LogName = @('System', 'Application')
    Level = 2 # Error
    StartTime = $since
} | Select-Object TimeCreated, LogName, Id, ProviderName, Message | Format-Table -AutoSize