rem A one-shot, first-time Windows configuration script that disables some
rem Windows mal/misfeatures [based on Chris Wellons'].

setlocal

set key=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer
reg add "%key%" /f /v AltTabSettings              /t REG_DWORD /d 0
reg add "%key%" /f /v DisableSearchBoxSuggestions /t REG_DWORD /d 1
set key=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
reg add "%key%" /f /v TaskbarGlomLevel          /t REG_DWORD /d 2
reg add "%key%" /f /v HideFileExt               /t REG_DWORD /d 0
reg add "%key%" /f /v ShowCortanaButton         /t REG_DWORD /d 0
reg add "%key%" /f /v ShowTaskViewButton        /t REG_DWORD /d 0
reg add "%key%" /f /v StoreAppsOnTaskbar        /t REG_DWORD /d 0
reg add "%key%" /f /v MultiTaskingAltTabFilter  /t REG_DWORD /d 3
reg add "%key%" /f /v JointResize               /t REG_DWORD /d 0
reg add "%key%" /f /v SnapFill                  /t REG_DWORD /d 0
reg add "%key%" /f /v SnapAssist                /t REG_DWORD /d 0
reg add "%key%" /f /v TaskbarAnimations         /t REG_DWORD /d 0
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds
reg add "%key%" /f /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\Search
reg add "%key%" /f /v SearchboxTaskbarMode      /t REG_DWORD /d 0
reg add "%key%" /f /v BingSearchEnabled         /t REG_DWORD /d 0
reg add "%key%" /f /v AllowSearchToUseLocation  /t REG_DWORD /d 0
reg add "%key%" /f /v CortanaConsent            /t REG_DWORD /d 0
set key=HKCU\Control Panel\Desktop
reg add "%key%" /f /v CursorBlinkRate           /t REG_SZ    /d -1
reg add "%key%" /f /v MenuShowDelay             /t REG_SZ    /d 0
reg add "%key%" /f /v UserPreferencesMask       /t REG_BINARY /d 9012078010000000
set key=HKCU\Control Panel\Desktop\WindowMetrics
reg add "%key%" /f /v MinAnimate                /t REG_SZ    /d 0
set key=HKCU\Control Panel\Accessibility
reg add "%key%" /f /v DynamicScrollbars         /t REG_DWORD /d 0
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband
reg delete "%key%" /f /v Favorites
set key=HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore
reg add "%key%"\location                 /f /v Value /t REG_SZ /d 0
reg add "%key%"\webcam                   /f /v Value /t REG_SZ /d 0
reg add "%key%"\microphone               /f /v Value /t REG_SZ /d 0
reg add "%key%"\userNotificationListener /f /v Value /t REG_SZ /d 0
reg add "%key%"\activity                 /f /v Value /t REG_SZ /d 0
reg add "%key%"\userAccountInformation   /f /v Value /t REG_SZ /d 0
reg add "%key%"\contacts                 /f /v Value /t REG_SZ /d 0
reg add "%key%"\appointments             /f /v Value /t REG_SZ /d 0
reg add "%key%"\phoneCallHistory         /f /v Value /t REG_SZ /d 0
reg add "%key%"\email                    /f /v Value /t REG_SZ /d 0
reg add "%key%"\userDataTasks            /f /v Value /t REG_SZ /d 0
reg add "%key%"\chat                     /f /v Value /t REG_SZ /d 0
reg add "%key%"\radios                   /f /v Value /t REG_SZ /d 0
reg add "%key%"\bluetoothSync            /f /v Value /t REG_SZ /d 0
reg add "%key%"\appDiagnostics           /f /v Value /t REG_SZ /d 0
reg add "%key%"\documentsLibrary         /f /v Value /t REG_SZ /d 0
reg add "%key%"\picturesLibrary          /f /v Value /t REG_SZ /d 0
reg add "%key%"\videosLibrary            /f /v Value /t REG_SZ /d 0
reg add "%key%"\broadFileSystemAccess    /f /v Value /t REG_SZ /d 0
set "key=HKCU\Control Panel\International\User Profile"
reg add "%key%"                          /f /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1
set "key=HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
reg delete "%key%"                       /f /va
reg add "%key%"                          /f /v Enabled /t REG_DWORD /d 0
set "key=HKCU\SOFTWARE\Microsoft\Internet Explorer\International"
set "val=AcceptLanguage"
reg query "%key%" /v "%val%" 2>nul && (
reg delete "%key%"                       /f /v "%val%"
)

rem Reload
taskkill /f /im explorer.exe
start explorer.exe