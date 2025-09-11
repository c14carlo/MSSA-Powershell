# Get computer information and display it in a table

$compInfo = [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
    OSVersion    = (Get-CimInstance Win32_OperatingSystem).Version
    OSName       = (Get-CimInstance Win32_OperatingSystem).Caption
    Manufacturer = (Get-CimInstance Win32_ComputerSystem).Manufacturer
    Model        = (Get-CimInstance Win32_ComputerSystem).Model
    TotalRAMGB   = "{0:N2}" -f ((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB)
    Processor    = (Get-CimInstance Win32_Processor).Name
    UserName     = $env:USERNAME
}

$compInfo | Format-Table -AutoSize