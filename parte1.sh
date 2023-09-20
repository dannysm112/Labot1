#!/bin/bash

function get_permissions_verbose {

        string_permisos=$1
        usuario=${string_permisos:1:3}
        grupo=${string_permisos:4:3}
        otros=${string_permisos:7:3}

        echo " "

        echo "Permisos del Usuario:"

        for indice in {0..2}
        do
                if [ "${usuario:$indice:1}" == "r" ]; then
                        echo "Leer"
                elif [ "${usuario:$indice:1}" == "w" ]; then
                        echo "Editar"
                elif [ "${usuario:$indice:1}" == "x" ]; then
                        echo "Ejecutar"
                fi
        done

        echo " "

        echo "Permisos del Grupo: "

        for indice in {0..2}
        do
                if [ "${grupo:$indice:1}" == "r" ]; then
                        echo "Leer"
                elif [ "${grupo:$indice:1}" == "w" ]; then
                        echo "Editar"
                elif [ "${grupo:$indice:1}" == "x" ]; then
                        echo "Ejecutar"
                fi
        done

        echo " "

        echo "Permisos de Otros:"

        for indice in {0..2}
        do
                if [ "${otros:$indice:1}" == "r" ]; then
                        echo "Leer"
                elif [ "${otros:$indice:1}" == "w" ];then
                        echo "Editar"
                elif [ "${otros:$indice:1}" == "x" ]; then
                        echo "Ejecutar"
                fi
        done

        echo " "

}

if [ -e $1 ]; then
        permisos=$(stat -c "%A%" $1)
        get_permissions_verbose $permisos
else
        echo "El archivo no existe"
fi

          
