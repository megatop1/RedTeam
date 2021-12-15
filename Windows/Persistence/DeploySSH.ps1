[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -URI https://github.com/PowerShell/Win32-OpenSSH/releases/download/V8.6.0.0p1-Beta/OpenSSH-Win64.zip -Outfile C:\Windows\System32\OpenSSH-Win64.zip
[Io.Compression.ZipFile]::ExtractToDirectory("C:\Windows\System32\OpenSSH-Win64.zip", "C:\Windows\System32")
C:\Windows\System32\OpenSSH-Win64\install-sshd.ps1
C:\Windows\System32\OpenSSH-Win64\ssh-keygen-t rsa -b 2048
Start-Service -Name sshd
netsh advfirewall firewall add rule name="SSH" dir=in action=allow protocol=TCP localport=22
attrib +h C:\Users\<user>\.ssh
