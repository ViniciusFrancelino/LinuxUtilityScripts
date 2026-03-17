#!/bin/bash

# Busca a hora do sistema
date=(`date +%a` `date +%H`)

# Busca o ip da bb para validação
ip=`curl ifconfig.me`

kill_process() {

    # Busca o processo do openvpn para matar os processos caso esteja em horario do almoço.
    ps=`ps -aux | grep -v "grep" | grep -i "openvpn" | awk '{print $2}'`

    for i in $ps
    do
        kill $i
    done

}

# Condição para saber se esta dentro do horario de Trabalho.
if [ ${date[1]} -ge "08" ] && [ ${date[1]} -lt "17" ]; then

    if [ $ip != "187.8.187.66" ]; then

        if [ ${date[1]} -eq "12" ] ; then

            echo "`date` | Horario de almoço" >> /var/log/scripts-log/vpn-connect.log
            kill_process
            exit 0;

        fi

        # Seta o usuario e senha no arquivo de conf para usar no openvpn
        usr="vsilva" ; pass="123@Teste"
        echo -e "$usr\n$pass" > /var/lib/openvpn/chroot/tmp/.access.txt

        # Conecta na VPN ssl usando o OPENVPN com o usr e senha no arquivo descrito
        echo "Screen" #screen -S vpn_session -dm openvpn --config /home/vsilva/bb-vpn.ovpn --auth-user-pass /var/lib/openvpn/chroot/tmp/.access.txt &>/dev/null
        sleep 3 ; rm -f /var/lib/openvpn/chroot/tmp/.access.txt
        echo "`date` | VPN Conectada" >> /var/log/scripts-log/vpn-connect.log

    else

        echo "`date` | VPN já esta logada" >> /var/log/scripts-log/vpn-connect.log

    fi

else

    # Desconecta da VPN matando os processos após o final do expediente
    kill_process
    echo "`date` | Fora Do Horario de Trabalho" >> /var/log/scripts-log/vpn-connect.log

fi
