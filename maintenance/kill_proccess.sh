#!/bin/bash

read -p "Informe o parametro para busca: " find

for ps in `ps -aux | grep -v grep | grep -i "$find" | awk '{print $2}'`
do

    echo "Processo: '$ps'"
    kill -9 $ps

done
