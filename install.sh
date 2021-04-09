PREINSTALL=./pre_install.sh    


if [ "$EUID" -ne 0 ]; then
    echo -e "\e[31mThis script needs root privileges! Please run with sudo!\e[0m"
    exit
fi

if test -f "$PREINSTALL"; then
    cp -R ../configurator_taker /home/"$SUDO_USER"/
    bash "$PREINSTALL"
    exit 
fi 


#remove libreoffice and geary
sudo apt remove --purge libreoffice*
sudo apt remove geary

sudo snap install spotify
sudo snap install gitkraken --classic
sudo snap install discord
snap connect discord:system-observe

#VS CODE
sudo snap install code --classic

#MS TEAMS
sudo snap install teams


#MailSpring
sudo snap install mailspring

#FlameShot
sudo snap install flameshot

#Plank
sudo add-apt-repository ppa:ricotz/docky
sudo apt-get update && sudo apt-get install plank

#Password Safe
wget -O pswsafe.deb https://sourceforge.net/projects/passwordsafe/files/Linux/1.13.0/passwordsafe-ubuntu20-1.13-amd64.deb/download
sudo dpkg -i pswsafe.deb
rm -f pswsafe.deb


#NOTION
sudo snap install notion-snap

#papirus icon pack
wget -O papirus.deb https://launchpad.net/~papirus/+archive/ubuntu/papirus/+files/papirus-icon-theme_20210401-5189+pkg21~ubuntu20.04.1_all.deb
sudo dpkg -i papirus.deb
rm -f papirus.deb


#gnome-tweaks -> enable minimize and maximize and choose correct icon pack
sudo apt install gnome-tweaks
gnome-tweaks

#import all alias from alias file
echo ". /home/$SUDO_USER/configurator_taker/alias" >> /home/"$SUDO_USER"/.bashrc

#docker
sudo apt-get remove docker docker-engine docker.io containerd runc

 sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io









