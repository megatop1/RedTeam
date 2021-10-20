#  Red team during CCDC changed permissions of executables for services to be owned by trusted installer then disallowed the Admin to start/stop the services
icacls "C:\Windows\regedit.exe" /setowner "NT SERVICE\TrustedInstaller"
icacls "C:\Windows\regedit.exe" /grant:r Administrators:R

icacls "C:\Windows\regedit.exe" /grant:r Administrators:R
