#!/bin/bash
echo "Openvpn installation program"
if [[ $EUID -ne 0 ]]; then
   echo "THIS SCRIPT MUST BE RUN AS ROOT!!!!" 
   exit 1
fi
echo "Updating the system..."
sudo apt update && sudo apt upgrade
echo "Installing features..."
sudo apt -y install ca-certificates wget net-tools gnupg
sudo wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc
sudo touch /etc/apt/sources.list.d/openvpn-as-repo.list
sudo echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian bookworm main" > /etc/apt/sources.list.d/openvpn-as-repo.list
sudo apt update && sudo apt -y install openvpn openvpn-as
echo "All set, enjoy Openvpn!!!!"
