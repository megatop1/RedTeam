schtasks /create /sc minute /mo 5 /tn "Malware" /tr C:\Users\Administrator\AppData\Local\CreateThousandUsers.ps1
schtasks /create /sc minute /mo 5 /tn "System Cleanup" /tr C:\Users\Administrator\AppData\Local\autoruns.exe
