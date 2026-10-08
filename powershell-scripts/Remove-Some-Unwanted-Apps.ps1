#requires -RunAsAdministrator
<#
.SYNOPSIS
  
.DESCRIPTION
  Removes some of the Unwanted Apps bundled into Windows 11 Pro/Enterprise
  Date: 09/10/2026

#>

Write-Output "Uninstalling some unwanted apps"
$apps = @(
    # default Windows gaming and xbox related apps
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.MinecraftUWP"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxApp"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
#    "Microsoft.GamingApp"
)

foreach ($app in $apps) {
    Write-Output "Trying to remove $app"

    # Get the app version
    $appVersion = (Get-AppxPackage -Name $app).Version 

    If ($appVersion){ 
      # If the apps is found, remove it
      Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
    }
    
    # Remove the app from the local Windows Image to prevent re-install on new user accounts
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -EQ $app | Remove-AppxProvisionedPackage -Online

    # Cleanup Local App Data
    $appPath="$Env:LOCALAPPDATA\Packages\$app*"
    Remove-Item $appPath -Recurse -Force -ErrorAction 0
}
