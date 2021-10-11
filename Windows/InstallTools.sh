# Script to Automatically install the Red Team's Toolkit by RJ
cd /opt

# Install Evil-WinRM
sudo gem install evil-winrm
sudo git clone https://github.com/Hackplayers/evil-winrm.git

# Install Covenant C2
sudo git clone --recurse-submodules https://github.com/cobbr/Covenant

sudo wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo rm -f packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get -y install dotnet-sdk-3.1

cd Covenant/Covenant
sudo dotnet run

# Install PowerShell Empire 
sudo git clone https://github.com/BC-SECURITY/Empire.git
cd /opt/Empire/setup
./install.sh


# The below tools are used to encrypt files to stage our shellcode onto enemy team's systems. Also known as cryptors

# Install Unicorn
sudo git clone https://github.com/trustedsec/unicorn.git

# Install Shellter 
sudo apt-get install shellter
