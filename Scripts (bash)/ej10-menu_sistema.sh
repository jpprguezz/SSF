#!/bin/bash

echo "              ***************"
echo "              *** M E N Ú ***"
echo "              ***************"
echo ""
echo "porlibre o 1: Indica el espacio libre de la partición raíz (en porcentaje)"
echo "tamlibre o 2: Indica el espacio libre de la partición raíz (en tamaño)"
echo "usuario o 3: Indica el usuario actual"
echo "maquina o 4: Indica el nombre de la máquina"
echo "usuarios o 5: Indica el número de usuarios del sistema"
echo "espacio o 6: Total de espacio usado en todos mis directorios personales (en formato "humano": M, G, ...)"
echo "libre o 7: Muestra la memoria libre" 
echo "salir o 8: Te saca del sistema"  
echo -p "Introduzca su opción: " opcion

case "$opcion" in
        "porlibre"|1) df -h 
        ;;


        "tamlibre"|2) df -h
        ;;


        "usuario"|3) whoami
        ;;


        "maquina"|4) hostname
        ;;


        "usuarios"|5) #no encontre la forma concreta de hacerlo
        ;;


        "espacio"|6) du -sh /home/*/
        ;;


        "libre"|7) free
        ;;


        "salir"|8) exit
        ;;

        *) echo "ERROR: "esta opción no es correcta"
        ;;


esac