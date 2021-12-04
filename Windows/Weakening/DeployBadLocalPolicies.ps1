# Disable Firewall Fully
netsh advfirewall set AllProfiles state off 

#Enable the Guest Account
net user guest /active:yes

#Add the guest user to the remote desktop group
NET LOCALGROUP "Remote Desktop Users" guest /ADD
