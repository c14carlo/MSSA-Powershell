# Report Syst Health.ps1
# Generates a basic system health report

$report = @{}

# Computer Info
$report.ComputerName = $env:COMPUTERNAME
$report.UserName = $env:USERNAME
$report.OSVersion = (Get-CimInstance Win32_OperatingSystem).Caption
$report.OSBuild = (Get-CimInstance Win32_OperatingSystem).BuildNumber

# Uptime
$lastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $lastBoot
$report.Uptime = "$($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"

# CPU Usage
$cpuLoad = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
$report.CPUUsage = "{0:N2}%" -f $cpuLoad

# Memory Usage
$os = Get-CimInstance Win32_OperatingSystem
$totalMem = [math]::Round($os.TotalVisibleMemorySize/1MB,2)
$freeMem = [math]::Round($os.FreePhysicalMemory/1MB,2)
$usedMem = $totalMem - $freeMem
$report.Memory = "Used: $usedMem GB / Total: $totalMem GB"

# Disk Usage
$diskInfo = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
$report.Disks = @()
foreach ($disk in $diskInfo) {
    $size = [math]::Round($disk.Size/1GB,2)
    $free = [math]::Round($disk.FreeSpace/1GB,2)
    $used = $size - $free
    $report.Disks += @{
        DeviceID = $disk.DeviceID
        UsedGB = $used
        FreeGB = $free
        TotalGB = $size
    }
}

# Network Info
$netAdapters = Get-NetAdapter | Where-Object Status -eq 'Up'
$report.NetworkAdapters = $netAdapters | Select-Object Name, Status, LinkSpeed

# Output Report
Write-Host "===== System Health Report ====="
Write-Host "Computer Name: $($report.ComputerName)"
Write-Host "User Name: $($report.UserName)"
Write-Host "OS Version: $($report.OSVersion) (Build $($report.OSBuild))"
Write-Host "Uptime: $($report.Uptime)"
Write-Host "CPU Usage: $($report.CPUUsage)"
Write-Host "Memory: $($report.Memory)"
Write-Host "`nDisk Usage:"
foreach ($disk in $report.Disks) {
    Write-Host " $($disk.DeviceID): Used $($disk.UsedGB) GB / Free $($disk.FreeGB) GB / Total $($disk.TotalGB) GB"
}
Write-Host "Network Adapters:"
$report.NetworkAdapters | Format-Table -AutoSize
Write-Host "==============================="