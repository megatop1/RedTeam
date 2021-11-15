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
1. Disable certain logs so you can complete your operation. Ensure to start those logs back up after the operation and clear the log saying the service was started/stopped in order for us to keep complete stealth
2. Identify the AD domain
3. Get information about the OS (version, patch level ex: SP1, etc)
4. Extract users and domain users and their corresponding groups
5. Determine is there are any online users
6. Gain user account hashes for offline cracking later. This can easily be done in metasploit
7. Kerberoasting: Extracts service account credential hashes from Active Directory for offline cracking

### Persistance

###### WMI
The WMI service accesses data using the Common Information Model (CIM). Not only does this store information about the system's hardware and software, it also tracks the current state of the system, including its running processes and services. Administrators can use WMI to to query the state of the system and its processes. WMI can also be used to control the system; for example, it can be used to start and stop processes. WMI allows administrators to define events that are fired up when a define state occurs on the system; and consumers, which are 

###### Autoruns

###### Startup Fplder

###### RSAT 

###### Services

###### DLL Injections

##### Hidden Processes 
In order to try to prevent us from being caught by an enemy team, we need to hide our running processes. Below is an example of how to do so
![image](https://user-images.githubusercontent.com/43348736/141865892-81421f32-fd79-4464-99f5-86c9c060c9e0.png)

### Implants
