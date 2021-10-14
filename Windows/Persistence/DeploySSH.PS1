 Invoke-WebRequest -URI  https://github.com/PowerShell/Win32-OpenSSH/releases/download/V8.6.0.0p1-Beta/OpenSSH-Win64.zip
 cd "C:\Program Files\OpenSSH-Win64"
 .\install-sshd.ps1
 .\ssh-keygen.exe -t rsa -b 2048
 Start-Service -name sshd
