## Initial Access
We will want to gain access to the box through the user of a Windows 0-day exploitation. The following are known-exploits to get us our initial foothold and reverse shell into a Windows target

- ZeroLogon
- EternalBlue
- BlueKeep
- PrintNightmare
- ms09_050_smb2_negotiate_func_index (Windows 2008 only)

If we are unable to exploit our way into the system, then we will have to resort to other methods for initial access.
- Windows Responder
- Pass-the-Hash

## Post Exploitation
Once we gain inital access into a windows system, we need to accomplish some tasks. 
1. Gain user account hashes for offline cracking later. This can easily be done in metasploit
2. Kerberoasting: Extracts service account credential hashes from Active Directory for offline cracking
3. Disable certain logs so you can complete your operation. Ensure to start those logs back up after the operation and clear the log saying the service was started/stopped in order for us to keep complete stealth

### Persistance

###### WMI

###### Autoruns

###### Startup Fplder

###### RSAT 

###### Services

###### DLL Injections

##### Hidden Processes 
In order to try to prevent us from being caught by an enemy team, we need to hide our running processes. Below is an example of how to do so
![image](https://user-images.githubusercontent.com/43348736/141865892-81421f32-fd79-4464-99f5-86c9c060c9e0.png)

### Implants
