#  Red team during CCDC changed permissions of executables for services to be owned by trusted installer then disallowed the Admin to start/stop the services
icacls "C:\Windows\regedit.exe" /setowner "NT SERVICE\TrustedInstaller"
icacls "C:\Windows\regedit.exe" /grant:r Administrators:R

icacls "C:\Windows\regedit.exe" /grant:r Administrators:R

#Must be in CMD!
$UserSID = Get-ADUser -Identity "Administrator" | Select SID
$serviceACL = sc sdshow dns
sc sdset dns D:(A;;CCLCSWWPDTLOCRRC;;;SY)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;IU)(A;;CCLCSWLOCRRC;;;SU)(A;;CCDCLCSWWPDTLOCRSDRCWDWO;;;SO)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)
