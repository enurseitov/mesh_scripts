#!/bin/sh -e
# compiles and installs batman-adv and batctl (version 2018.1)
# create file: 'nano batmaninstall' and copy this text
# then run: 'sh ./batmaninstall'
# reboot after install

sudo apt-get update
sudo apt-get install git raspberrypi-kernel-headers build-essential dkms libnl-3-dev libnl-genl-3-dev -y
cd /home/pi/mesh_scripts
wget https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2018.1.tar.gz
tar -xzvf batman-adv-2018.1.tar.gz
cd batman-adv-2018.1
sudo make
sudo make install

cd /home/pi/mesh_scripts
wget https://downloads.open-mesh.org/batman/stable/sources/batctl/batctl-2018.1.tar.gz
tar -xzvf batctl-2018.1.tar.gz
cd batctl-2018.1/
sudo make
sudo make install

cd /home/pi/mesh_scripts
sudo rm -R batctl-2018.1
sudo rm -R batman-adv-2018.1
rm batctl-2018.1.tar.gz
rm batman-adv-2018.1.tar.gz

sudo chmod +x init_mesh.sh

sudo cp dhcpcd.conf /etc/dhcpcd.conf
sudo cp rc.local /etc/rc.local

sudo reboot


exit 0
