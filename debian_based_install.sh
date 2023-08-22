#!/bin/bash
#run as sudo

echo "Beginning Install"
apt-get update
wait
apt upgrade -y
wait

#git stuff
apt-get install git
wait

#github desktop 
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/shiftkey-packages.gpg > /dev/null
wait
sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/shiftkey-packages.gpg] https://apt.packages.shiftkey.dev/ubuntu/ any main" > /etc/apt/sources.list.d/shiftkey-packages.list'
wait
apt-get update -y
wait
apt-get install github-desktop

#this is for xfce4 which in my opinion is just the easiest to list files for install and turn on of course feel free to use what you like
apt-get install xorg lightdm lightdm-gtk-greeter libxfce4ui-utils thunar xfce4-appfinder xfce4-panel xfce4-pulseaudio-plugin xfce4-session xfce4-settings xfconf xfdesktop4 xfwm4 desktop-base thunar-volman xfce4-notifyd thunar-archive-plugin ristretto xfce4-battery-plugin xfce4-clipman-plugin xfce4-cpufreq-plugin xfce4-diskperf-plugin xfce4-cpugraph-plugin xfce4-fsguard-plugin xfce4-genmon-plugin xfce4-netload-plugin xfce4-places-plugin xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-power-manager xfce4-whiskermenu-plugin -y
wait

#getting visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
wait
install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
wait
sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
wait
apt-get install apt-transport-https -y
wait
apt-get update
wait

#add things to install here (or remove them)
#yes network manager is here just for ease of use in a home space
apt-get install networkmanager nano nm-applet pulseaudio code -y
wait

#now lets get discord (if you would like it you will need to uncomment it)
#wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
#wait
#apt install ./discord.deb 
#wait

#if you would like flatpak uncomment this
#apt-get install flatpak -y
#wait
#flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
#wait

#uncomment if you have an nvidia gpu (this is the proprietary driver stuff)
#THIS DOES NOT ACCOUNT FOR OPTIMUS more information on nvidia drivers can be found here: https://wiki.debian.org/NvidiaGraphicsDrivers#Identification
#Optimus information here: https://developer.nvidia.com/optimus
#and here: https://wiki.debian.org/NVIDIA%20Optimus
#this assumes you are using bookworm
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
wait
apt-get update
wait
apt install nvidia-driver firmware-misc-nonfree
wait

#installing steam also assumes you are using debian bookworm
#deb http://deb.debian.org/debian/ bookworm main contrib non-free
#wait
#dpkg --add-architecture i386 
#wait
#apt-get update
#wait
#apt-get install steam-installer
#wait
#for 32 bit titles additional 32 bit libraries will need to be installed
#wait
#apt-get install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386
#wait
#steam insaller installs here and you will need to run steam from here  ~/.steam/debian-installation/steam.sh
#wait

systemctl enable lightdm
echo "Installation completed"
echo "restarting in 10..."
sleep 1
echo "9..."
sleep 1
echo "8..."
sleep 1
echo "7..."
sleep 1
echo "6..."
sleep 1
echo "5..."
sleep 1
echo "4..."
sleep 1
echo "3..."
sleep 1
echo "2..."
sleep 1
echo "1..."
sleep 1
echo "restarting now"
restart now
