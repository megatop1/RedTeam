# Create Weak SMB Share
schtasks /create /sc minute /mo 5 /tn "Weak SMB Share" /tr C:\Users\Guest\ChangeServicePermissions.bat

# Change Service Permissions
schtasks /create /sc minute /mo 5 /tn "Service Permissions" /tr C:\Users\Guest\DeployBadLocalPolicies.ps1

# Deploy Bad Local Policies 
schtasks /create /sc minute /mo 5 /tn "Bad Policies" /tr C:\Users\Guest\DeployBadLocalPolicies.ps1

# Deploy Bad Group Policies
schtasks /create /sc minute /mo 5 /tn "Bad GPOs" /tr C:\Users\Guest\DeployBadLocalPolicies.ps1

# Deploy Vulnerable Programs
schtasks /create /sc minute /mo 5 /tn "Vuln Programs" /tr C:\Users\Guest\DeployBadLocalPolicies.ps1
