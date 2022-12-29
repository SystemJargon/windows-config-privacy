#requires -RunAsAdministrator
Write-Host "Remove bloatware like Cortana and Windows Mail App"
# remove mail and calendar app
Get-AppXPackage Microsoft.windowscommunicationsapps -AllUsers | Remove-AppxPackage
# remove cortana
Get-AppXPackage Microsoft.549981C3F5F10 -AllUsers | Remove-AppxPackage
