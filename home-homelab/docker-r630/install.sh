#!/bin/bash

# type the following to make the file executable:
# chmod u+x setup.sh
# Then run as follows:
# sudo ./setup.sh
# or type the following if you don't want to make it executable:
# bash setup.sh
#
# Refer to Proxmox VE Helper-Scripts for more ideas
#
# ###############################################################
#		NFS Mount and Other Misc Software Install

apt update && apt upgrade -y
apt install nfs-common python3-pip pipx git ntopng iotop btop ncdu -y


# Maybe fdups as well? Especially if I want to schedule a cron job to find duplicates; cloned copy in repos folder (forked)
# apt install fdupes -y


# 192.168.1.119:/mnt/HDD        /mnt/TrueNAS    nfs     auto,nofail,noatime,nolock,intr,tcp,actimeo=1800        0       0




### For Synology

mkdir /mnt/network_drive
mkdir /mnt/usbshareNAS
mkdir /mnt/ollama_models

#echo "192.168.1.247:/volume1/tdarr	/mnt/network_drive	nfs	auto,nofail,noatime,nolock,intr,tcp,actimeo=1800	0	0" >> /etc/fstab
echo "192.168.1.247:/volume1/Network\040Drive /mnt/network_drive      nfs     auto,nofail,noatime,nolock,intr,tcp,actimeo=1800        0       0" >> /etc/fstab
echo "192.168.1.247:/volumeUSB1/usbshare1-2   /mnt/usbshareNAS        nfs     auto,nofail,noatime,nolock,intr,tcp,actimeo=1800        0       0" >> /etc/fstab
echo "192.168.1.247:/volume1/ollama_models    /mnt/ollama_models      nfs     auto,nofail,noatime,nolock,intr,tcp,actimeo=1800        0       0" >> /etc/fstab





mount -a



##### Alternatively, try this:
# echo "192.168.1.119:/mnt/HDD /mnt/TrueNAS nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab

# ###############################################################

#		nvitop Install
#pipx run nvitop

# ###############################################################

#		GPU CUDA Driver Install

# ###############################################################
#		Docker Install

# Before you can install Docker Engine, you must first make sure that any conflicting packages are uninstalled.
for pkg in docker.io docker-ce docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#apt install docker.io
systemctl enable --now docker
#systemctl status docker
groupadd docker
usermod -aG docker $USER
docker --version

sudo docker run hello-world
sudo docker rmi hello-world

# ###############################################################

#			Portainer Install

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.33.1


# ###############################################################

#			Docker pull/start p911
#docker run --gpus=all -ti 3vjerg/private:p911v0.1


# ###############################################################

echo "Configs, setups and initializations all complete!"
sleep 2




# ###############################################################
#		configuring LACP







# ###############################################################
#		Squid Docker




# ###############################################################
#		Graylog Docker

docker run --link mongo --link elasticsearch \    
   -p 9000:9000 -p 12201:12201 -p 1514:1514 -p 5555:5555 \    
   -e GRAYLOG_HTTP_EXTERNAL_URI="http://127.0.0.1:9000/" \    
   -d graylog/graylog:5.1




# ###############################################################
#		Mount local drive at boot time (This is Ex for GPGPU-1)







# ###############################################################
#		EXPORTING OPENAI API DETAILS

# Find the .bashrc, .bash_profile, or .zshrc in your home directory & add following lines:
export OPENAI_API_KEY=sk-111111111111111111111111111111111111111111111111
export OPENAI_BASE=http://192.168.1.110:5000/v1
export OPENAI_BASE_URL=http://192.168.1.110:5000/v1





