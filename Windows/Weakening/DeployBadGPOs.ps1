# This file must be deployed on a domain controller

#The below is custom group policy objects created by RJ Pisciotta. These are great to deploy during an emergency or just for genera hardening

Import-Module ActiveDirectory
Import-Module GroupPolicy 

$domainName = Read-Host -Prompt 'Please enter your domain. Ex: example.com or ad.example.com'

#Seperate each . in the domain into its own word. ex: ad.example.com word1=ad word2=example, word3=example
$domainArray = $domainName.Split(".")


#Count number of dots (delimiter for string seperation) and store result in variable
$charCount = ($domainName.ToCharArray() | Where-Object {$_ -eq '.'} | Measure-Object).Count

#Find number of words in domains then store result into target 
If ($charCount -eq 1) {
$word1 = $domainArray[0]
$word2 = $domainArray[1]

#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2"
}
ElseIf ($charCount -eq "2") {
$word1 = $domainArray[0]
$word2 = $domainArray[1]
$word3 = $domainArray[2]
#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2,dc=$word3"
}
ElseIf ($charCount -eq "3") {
$word1 = $domainArray[0]
$word2 = $domainArray[1]
$word3 = $domainArray[2]
$word4 = $domainArray[3]
#set the value of target for the GPLink
$target = "dc=$word1,dc=$word2,dc=$word3,dc=$word4"
}

#Disable Firewall Service (Requires Reboot)
New-GPO -name "DisableFirewall" -domain $domainName
Set-GPRegistryValue -name "DisableDomainFirewall" -domain $domainName -key "HKLM\SYSTEM\CurrentControlSet\Services\mpssvc" -ValueName "Start" -Type DWORD -Value 4
New-GPLink -name "DisableFirewall" -Target $target -LinkEnabled Yes 

# GPO3: Enable SMB1 Accross the domain and disable SMB2 and SMB3 (Requires reboot)
New-GPO -name "EnableSMB1" -domain $domainName
Set-GPRegistryValue -name "EnableSMB1" -key "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -ValueName "SMB1" -Type DWORD -Value 1
New-GPLink -name "EnableSMB1" -Target $target -LinkEnabled Yes 

# Enable Guest Account

# Add guest account to domain admin

# Enable Windows to Store LAN Manager Hash

# Enable Print-Spooler Service

# Disable Windows Defender

# Disable Services such as firewall, 

# Dont require kerberos for account authentication

# Store passwords with reversable encryption 

# Disable account lockouts

# Always install elevated AlwaysInstallElevated (always installs with admin rights)

# Make vulnerable to Print Nightmare
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint
    RestrictDriverInstallationToAdministrators  REG_DWORD  0x0
    NoWarningNoElevationOnInstall               REG_DWORD  0x1
