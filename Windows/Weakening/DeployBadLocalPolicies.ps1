# Disable Firewall Fully
netsh advfirewall set AllProfiles state off 

# Enable SMB1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 1 -Force

# Allow any PowerShell Scripts to be Executed
Set-ExecutionPolicy -ExecutionPolicy unrestricted

# Allow Plaintext Credentials to be Cached
reg add HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest /v UseLogonCredential /t REG_DWORD /d 1

# Enable Windows to Store LAN Manager Hash
# Enable Print-Spooler Service https://www.digitalwelt.org/en/tips/software/disable-services-state-through-regedit
# Enable Plaintext Passwords
# Disable LSA to make system vulnerable to mimikatz
# Enable WDigest to make system vulnerable to mimikat
# Always install elevated AlwaysInstallElevated (always installs with admin rights)
# Make vulnerable to Print Nightmare
# Disable Scored Services if Team is losing (RDP, SMB, PSEXEC, etc)
