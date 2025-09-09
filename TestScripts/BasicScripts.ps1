#List all running processes
Get-Process

#List all running processes with specific properties
Get-Process | Select-Object Name, Id, CPU

#Display the top 10 services that are set to Automatic startup
Get-Service | Where-Object {$_.StartType -eq 'Automatic'} | Select-Object Name, Status | Sort-Object Name | Select-Object -First 10

#Find the Powershell version running on the system
$PSVersionTable.PSVersion

#Navigate the file system
Set-Location -Path C:\Windows\System32

#Navigate the file system and display only .log files
Get-ChildItem -Path C:\Windows\System32 -Filter *.log

#Run a command
ipconfig /all

#Run a command and filter the output
ipconfig /all | Select-String "IPv4"

#Display network adapters
Get-NetAdapter

#Display network configuration
Get-NetIPConfiguration

#Display all network adapters with specific properties
Get-NetAdapter | Select-Object Name, Status, MacAddress, LinkSpeed

#List only stopped services
Get-Service | Where-Object {$_.Status -eq 'Stopped'}

#List all installed Windows features
Get-WindowsFeature | Where-Object {$_.Installed -eq $true}

#List all installed Windows features with specific properties
Get-WindowsFeature | Where-Object {$_.Installed -eq $true} | Select-
Object Name, DisplayName, InstallState

#Display drive letters and free space in GB
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Free, Used, @{Name="Free(GB)";Expression={[math]::round($_.Free/1GB,2)}}, @{Name="Used(GB)";Expression={[math]::round($_.Used/1GB,2)}} | Format-Table -AutoSize                

#Restart a service
Restart-Service -Name "wuauserv" -Force

#Stop a service
Stop-Service -Name "wuauserv" -Force

#Start a service
Start-Service -Name "wuauserv"  

#Check for Windows updates
Get-WindowsUpdate

#Install all available Windows updates
Install-WindowsUpdate -AcceptAll -AutoReboot

#Instaall a specific windows update
Install-WindowsUpdate -KBArticleID "KB5003637" -AcceptAll -AutoReboot

#create a new local user
New-LocalUser -Name "TestUser" -Password (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) -FullName "Test User" -Description "This is a test user account"

#Add a local user to a local group
Add-LocalGroupMember -Group "Administrators" -Member "TestUser"

#Remove a local user from a local group
Remove-LocalGroupMember -Group "Administrators" -Member "TestUser"

#Remove a local user
Remove-LocalUser -Name "TestUser"

#Display local users
Get-LocalUser