#!/bin/bash

####################################
#
# Nombre: Gestión_software.sh
# Autor: Isaías Toledo Polegre y Jose Manuel
#
# Objetivo: Gestionar servicios de un equipo con S.O. Linux.
#
# Entradas: Nombre del servicio
# Salidas: La posibilidad de controlar los servicios a través de un menu en la terminal.
#
# Historial:
#        2024-02-27: Versión 1
#
####################################

service_manage_menu() {
    echo ""
    echo "┌────────────────┐"
    echo "│    M E N U     │"
    echo "└────────────────┘"
    echo ""
    echo "Para  pulse 1"
    echo "Para  pulse 2"
}

service_name=$1

while [ -z "$service_name" ]
do
    read -p "Debe de introducir el nombre del servicio como argumento: " service_name
done

systemctl status $service_name > /dev/null 2> /dev/null
if [ $? -eq 4 ] ; then
    echo "El servicio que ha introducido no existe"
    exit 10
fi

echo "Información sobre el servicio $service_name"
active_status=`systemctl is-active $service_name`
err_code=$?
if [ "$err_code" -eq 0 ] ; then
    echo "$service_name está actualmente activo"
else
    echo "$service_name está actualmente inactivo"
fi

boot_status=`systemctl is-enabled $service_name`
err_code=$?
if [ "$err_code" -eq 0 ] ; then
    echo "$service_name está actualmente habilitado"
elif [ "$boot_status" == "disabled" ] ; then
    echo "$service_name está actualmente deshabilitado"
else
    echo "$service_name está actualmente enmascarado"
fi

service_manage_menu "$active_status" "$boot_status"

    echo "                   ┌────────────────┐"
    echo "                   │    M E N U     │"
    echo "                   └────────────────┘"
    echo "┌──────────────────────────────────────────────────────────────────────────┐"
    echo "1- Activar el servicio (si esta activo, se ofrece la opción de desenmascararlo)"
    echo "2- Habilitar el servicio (si esta habilitado, se ofrece la opción de desabilitarlo)"
    echo "3- Enmascarar el servicio (si ya lo estaba, se ofrece la poción de desenmascararlo)"
    echo "4- Mostrar configuración del servicio"
    echo "5- Reiniciar  el servicio (dejando el servicio activo)"
    echo "6- Reiniciar  el servicio (dejando el servicio en su último estado)"
    echo "7- Aplicar cambios enm la configuración dejando el servicio activo (itentando evitar interrupción del servicio)"
    echo "8- Aplicar cambios en la configuración dejando el servicio en su último estado (intentando evitar la interrupción del servicio)"
    echo "9- Asignar la configuración de habilitado/deshabilitado indicada por el desarrollador (vendor preset)"
    echo "10- Mostrar el tiempo de carga total del sistema"
    echo "11- Mostrar el tiempo de carga de este servicio"
    echo "12- Mostrar el nivel de ejecución actual del equipo"
    echo "13- Apagar el equipo (usar el comando de control de servicios)"
    echo "14- Reiniciar el equipo (usar el comando de control de servicios)"
    echo "15- SALIR"
    echo "└──────────────────────────────────────────────────────────────────────────┘"
    read -p "Introduzco su la opcion que desee: " opcion
    case "$opcion" in
        1)
        ;;
        2)
        ;;
        3)
        ;;
        4)
        ;;
        5)
        ;;
        6)
        ;;
        7)
        ;;
        8)
        ;;
        9)
        ;;
        10)
        ;;
        11)
        ;;
        12)
        ;;
        13)
        ;;
        14)
        ;;
        15)
        echo "Saliendo del menu"
        exit
        ;;

    esac