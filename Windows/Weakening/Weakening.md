### Weakening
Welcome to the Windows Weakening code. This is what we use during CTFs to weaken system and make them vulnerable to further attacks, to keep our C2 more hidden, and ensure our target has paid the price

##### Change Service Permissions
This changes service permissions to trusted installer, to prevent a blue teamer from being able to start/start/restart services. It grey's out the services.msc gui for the service we change the permission too. 

##### Deploy Bad GPOs
This deploys group policy objects on a Domain Controller to weaken all windows machines within a domain. The following are the current GPOs to weaken all machines on a domain

- Enable SMB1 accross a domain to make all machines vulnerable to eternalblue
- Make all machines on domain vulnerable to Mimikatz
- Make all machines on domain vulnerable to **kerberoasting**
- Disable ASLR on all machines accross domain to make our malware run smoother
- Make windows vulnerable to zero-logon
- Enable printing service accross domain 
- Disable the windows firewall accross the domain
- Change the password of the Domain Administrator to "Password1!"
- Enable guest account accross domain 
- Change stickey keys to CMD when user presses shift 5 times

##### Deploy Bad local Policies 
Perform all of the same policies in GPO except only locally for a system. This is arguably more important in case we do not have access to a domain controller.
