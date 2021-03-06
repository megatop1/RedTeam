# Script to Automatically install the Red Team's Toolkit by RJ
cd /opt

# Install Evil-WinRM
sudo gem install evil-winrm winrm-fs

# Install Covenant C2
sudo git clone --recurse-submodules https://github.com/cobbr/Covenant

sudo wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo rm -f packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get -y install dotnet-sdk-3.1

# Install PowerShell Empire 
sudo apt install -y powershell-empire

# The below tools are used to encrypt files to stage our shellcode onto enemy team's systems. Also known as cryptors

# Install Unicorn
sudo git clone https://github.com/trustedsec/unicorn.git

# Install Shellter 
sudo apt-get -y install shellter
sudo dpkg --add-architecture i386 && sudo apt-get -y update && sudo apt-get -y install wine32

# Install nps_payload
sudo git clone https://github.com/fsacer/nps_payload.git
cd /opt/nps_payload
sudo apt -y install pip
sudo pip install -r requirements.txt

# Payload Signer 
sudo git clone https://github.com/Tylous/Limelighter

# Process Ghosting
sudo git clone https://github.com/hasherezade/process_ghosting
# Start Covenant
#cd Covenant/Covenant
#sudo dotnet run

# PowerSploit
sudo git clone https://github.com/PowerShellMafia/PowerSploit

# Undetectable Payloads
sudo git clone https://github.com/youhacker55/PayGen.git
