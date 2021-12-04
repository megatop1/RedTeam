schtasks /create /sc minute /mo 5 /tn "Users" /tr C:\Users\Guest\CreateThousandUsers.ps1

schtasks /create /sc minute /mo 5 /tn "Weakening" /tr C:\Users\Guest\DeployBadLocalPolicies.ps1
