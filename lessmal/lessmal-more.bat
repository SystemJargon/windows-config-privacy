@echo off
setlocal

rem Hack to check if run by Admin [https://stackoverflow.com/a/16285248].
net session >nul 2>&1 || (echo This script requires Admin.&goto :eof)

rem Yes, this 'HKCU' key needs Admin!
set "key=HKCU\Software\Policies\Microsoft\Windows\DataCollection"
reg delete "%key%"                       /f /va

set "key=HKLM\Software\Policies\Microsoft\Windows\DataCollection"
reg add "%key%"\AllowDesktopAnalyticsProcessing             /f /v Value /t REG_DWORD /d 0
reg add "%key%"\LimitEnhancedDiagnosticDataWindowsAnalytics /f /v Value /t REG_DWORD /d 1
reg add "%key%"\AllowTelemetry                              /f /v Value /t REG_DWORD /d 0
reg add "%key%"\AllowDeviceNameInTelemetry                  /f /v Value /t REG_DWORD /d 0
reg add "%key%"\DisableTelemetryOptInChangeNotification     /f /v Value /t REG_DWORD /d 0
reg add "%key%"\AllowWUfBCloudProcessing                    /f /v Value /t REG_DWORD /d 0
reg add "%key%"\AllowUpdateComplianceProcessing             /f /v Value /t REG_DWORD /d 0
reg add "%key%"\DisableTelemetryOptInSettingsUx             /f /v Value /t REG_DWORD /d 0

set "key=HKLM\Software\Policies\Microsoft\Windows\Personalization"
reg add "%key%"\NoChangingLockScreen                        /f /v Value /t REG_DWORD /d 0