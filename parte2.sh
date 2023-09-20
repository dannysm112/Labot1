#!/bin/bash

usuario=$1
grupo=$2
existe_usuario="no"
existe_grupo="no"

for user in $(cat /etc/passwd | cut -d":" -f 1)
do
        if [ "$user" == "$usuario" ]; then
                echo "El usuario ya existe"
                existe_usuario="si"
        fi
done

for group in $(cat /etc/group | cut -d":" -f 1)
do
        if [ "$group" == "$grupo" ]; then
                echo "El grupo ya existe"
                existe_grupo="si"
        fi
done

if [ "$existe_usuario" == "no" ]; then
        sudo useradd $usuario
fi

if [ "$existe_grupo" == "no" ]; then
        sudo groupadd $grupo
fi

sudo usermod -aG $grupo $usuario

sudo usermod -aG $grupo dannysm

sudo chown dannysm:$grupo parte1.sh

chmod ug+x parte1.sh

