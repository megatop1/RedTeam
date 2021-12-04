# Disable Firewall Fully
netsh advfirewall set AllProfiles state off 

#Enable the Guest Account
net user guest /active:yes

#Add the guest user to the remote desktop group
NET LOCALGROUP "Remote Desktop Users" guest /ADD

NET LOCALGROUP "Remote Management Users" guest /ADD

# Enable SMB1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 1 -Force
