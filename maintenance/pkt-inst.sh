#!/bin/bash

# Pacotes a serem instalados no linux
pacotes=(
    net-tools
    vim
    dnsutils
    iptables
    speedtest-cli
    xsensors
    traceroute
    ipcalc
    curl
    wget
    arping
    traceroute
    tcpdump
    nmap
    conntrack
    ethtool
    make
    gcc
    xxd
    htop
    sysstat
    rsyslog
    python3
    xrdp
    vinagre
    terminator
    screen
    openvpn
    network-manager-openvpn
    ldap-utils
)


for i in "${pacotes[@]}"
do
    echo "Instalando Pacote: $i"
    apt-get install $i -y > /dev/null 2>&1

    if [ $? -eq 0 ]; then

        echo "Pacote $i Instalado com SUCESSO!!"

    else

        echo "Pacote $i Não instalado, tentar novamente mais tarde!!"

    fi

done
