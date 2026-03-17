#!/bin/bash

echo "Escolha uma opção"
echo "(1) Enable DHCP;"
echo "(2) Disable DHCP;"
echo "(3) Exit;"
read -p "Option: " i

case "$i" in
	1)
        sed -i 's/INTERFACESv4=""/INTERFACESv4="eth0"/' /etc/default/isc-dhcp-server
		systemctl enable isc-dhcp-server
		systemctl start isc-dhcp-server
		echo "DHCP Enabled!"
	;;
	2)
        sed -i 's/INTERFACESv4="eth0"/INTERFACESv4=""/' /etc/default/isc-dhcp-server
		systemctl disable isc-dhcp-server
		systemctl stop  isc-dhcp-server
		echo "DHCP Disabled!"
	;;
	3)
		echo "Exiting..."
	;;
esac
