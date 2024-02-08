#!/bin/bash
echo "Programa instalación openvpn"
if [[ $EUID -ne 0 ]]; then
   echo "ESTE SCRIPT DEBE SER EJECUTADO COMO ROOT!!!" 
   exit 1
fi
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade
echo "Instalamos caracteristicas..."
sudo apt -y install ca-certificates wget net-tools gnupg
sudo wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc
sudo touch /etc/apt/sources.list.d/openvpn-as-repo.list
sudo echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian bookworm main" > /etc/apt/sources.list.d/openvpn-as-repo.list
sudo apt update && sudo apt -y install openvpn-as
echo "Todo listo!!!"
