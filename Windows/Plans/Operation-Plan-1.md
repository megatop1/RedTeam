## Initial Access
We can gain initial access to a Windows box using 0-day CVE's. The following are known-exploits to get us our initial foothold and reverse shell into a Windows target

- ZeroLogon (Domain Controllers Only)
- EternalBlue
- BlueKeep
- PrintNightmare
- ms09_050_smb2_negotiate_func_index (Windows 2008 Only)
- SMB Ghost (Affects SMB3)

If we are unable to exploit our way into the system, then we will have to resort to other methods for initial access.
- Windows Responder
- Pass-the-Hash
- Extortion (This is a joke)

## Enumeration
Once we gain inital access into a windows system, we need to accomplish some tasks to get more information about the system. This is called enumeration

- Extract all user/service accounts on the system and if possible all AD users (if on DC) as well as their corresponding groups
- System hostname
- Get all the services on the system
- Get all the software/programs on the system
- Get list of running proceses on the system
- Get list of network connections on the system

## Post Exploitation (Covering Tracks Part 1)
Before we can begin planting persistance to ensure we stay on the system, we need to ensure we cover our tracks. 
- Stop the logging service in order to prevent any logging of actions we do 

## Persistance
This is arguably the most important part. Now that we are in, we need to stay in. We need to plant persistance to ensure if we lose a few shells we can get back in another way. We will setup several backdoors, and other methods to spawn reverse shells back to our C2 in case all of our shells are killed on the system. There are several forms of persistance for Windows, listed below. 

###### WMI
The WMI service accesses data using the Common Information Model (CIM). Not only does this store information about the system's hardware and software, it also tracks the current state of the system, including its running processes and services. Administrators can use WMI to to query the state of the system and its processes. WMI can also be used to control the system; for example, it can be used to start and stop processes. WMI allows administrators to define events that are fired up when a define state occurs on the system; and consumers, which are programs or scripts that are run when an event is fired

Covenant C2 has a persistWMI module to add in WMI Persistance. Below will trigger up WMI Persistence when **notepad** is opened up. This can easily be repeated for other programs.

###### Autoruns

###### Startup Folder
One of the simplest ways an attacker can maintain persistence is by using the Windows startup
folder; this is C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\
Programs\Startup for a user, and C:\ProgramData\Microsoft\Windows\Start Menu\Programs\
Startup for the system

Covenant C2 has a startup persistance task where it puts an executable and encodes a powershell launcher in the windows startup folder 

![image](https://user-images.githubusercontent.com/43348736/144560427-bebfa2cb-65dc-4f60-b860-fbb5eb0a8ea9.png)


###### RSAT 

###### Services
This can be accomplished in Empire or manually

###### DLL Injections

##### Hidden Processes 
In order to try to prevent us from being caught by an enemy team, we need to hide our running processes. Below is an example of how to do so
![image](https://user-images.githubusercontent.com/43348736/141865892-81421f32-fd79-4464-99f5-86c9c060c9e0.png)

## Implants

C2 Connection

We will establish connections to our C2 server. We will plant our beacons which are our Post Exploitation agents to allow to us remotely interact with the target system. This is the most important part, since we can do lots from our C2 server and organize our shells by team. 

## Post Exploitation/Enumeration/Persistance
There are some other tasks we can accomplish now that our persistance has been planted on the box. 

- Extract all the user hashes for offline cracking later (Mimikatz)
- Apply **weakening** scripts to the system to ensure if all of our persistance is burned and all backdoors have been terminated, then we have other methods of **exploitation** and methods of access to get back in. Some weakening includes kerberoasting, storing passwords in plaintext, etc
- Depending on the engagement, if the other team is scoring ahead of us, then apply scripts to disable their services from scoring and prohibit their ability to start said services again 

## Covering Tracks Part 2
- Burn any tradecraft that shouldn't be on the system to deny the enemy team from gaining access to our scripts and tools we used against them
- Start the logging service again and wipe the event IDs that correspond to stopping the logging service
