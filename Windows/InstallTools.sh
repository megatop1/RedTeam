# Script to Automatically install the Red Team's Toolkit by RJ
cd /opt

# Install Evil-WinRM
sudo gem install winrm winrm-fs stringio
git clone https://github.com/Hackplayers/evil-winrm.git

# Install Covenant C2
git clone --recurse-submodules https://github.com/cobbr/Covenant

wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-3.1

cd Covenant/Covenant
dotnet run

# Install Shellter 
