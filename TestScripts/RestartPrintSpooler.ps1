# RestartPrintSpooler.ps1
# Restarts the Print Spooler service

Restart-Service -Name 'Spooler' -Force
Write-Host "Print Spooler service has been restarted."