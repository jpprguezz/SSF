#!/bin/bash

####################################
#
# Nombre: Gestión_servicios.sh
# Autor: Isaías Toledo Polegre y Jose Manuel Peña Rodríguez
#
# Objetivo: Gestionar servicios de un equipo con S.O. Linux.
#
# Entradas: Nombre del servicio
# Salidas: La posibilidad de controlar el servicio a través de un menu en la terminal.
#
# Historial:
#        2024-02-28: Versión 1
#
####################################

service_manage_menu() {
    
    service_name=$1
    current_status=$2
    boot_status=$3

    # Aquí guardamos las condiciones en unas variables para no repetirlas 2 veces en la función.
    # Tenemos que usar los nombres de los estados porque masked comparte codigo con disabled.
    opt_1_cond=$( [ "$current_status" == "inactive" ] && [ "$boot_status" != "masked" ]; echo $? )
    opt_2_cond=$( [ "$boot_status" == "enabled" ]; echo $? )
    opt_3_cond=$( [ "$boot_status" == "enabled" ] || [ "$boot_status" == "disabled" ]; echo $? )


    echo "                   ┌────────────────┐"
    echo "                   │    M E N U     │"
    echo "                   └────────────────┘"
    echo "┌──────────────────────────────────────────────────────────────────────────┐"
    if [ "$opt_1_cond" -eq 0 ] ; then
        echo "  1) Para arrancar el servicio"
    else
        echo "  1) Para parar el servicio"
    fi

    if [ "$opt_2_cond" -eq 0 ] ; then
        echo "  2) Para deshabilitar el servicio"
    else
        echo "  2) Para habilitar el servicio (Tenga en cuenta que si esta enmascarado no se va a poder habilitar)"
    fi

    if [ "$opt_3_cond" -eq 0 ] ; then
        echo "  3) Para enmascarar el servicio"
    else
        echo "  3) Para desenmascarar el servicio"
    fi
    echo "  4) Para mostrar la configuración del servicio"
    echo "  5) Para reiniciar el servicio dejandolo activo"
    echo "  6) Para reiniciar el servicio dejandolo en su estado"
    echo "  7) Para aplicar los cambios en la configuración dejando el servicio activo e intentando evitar su interrupción (No se garantiza)"
    echo "  8) Para aplicar los cambios en la configuración dejando el servicio en su estado actual e intentando evitar su interrupción (No se garantiza)"
    echo "  9) Para restaurar los valores por defecto de habilitado/deshabilitado"
    echo "  10) Para mostra el tiempo de arranque del sistema"
    echo "  11) Para mostrar el tiempo de carga de $service_name"
    echo "  12) Para mostrar el nivel de ejecución actual"
    echo "  13) Para apagar el equipo"
    echo "  14) Para reiniciar el equipo"
    echo "  15) Para salir"
    echo "  Cualquier opción fuera de las indicadas llamará de nuevo al menú"
    echo "└──────────────────────────────────────────────────────────────────────────┘"
    echo ""

    read -p "Introduzca el número de la acción deseada: " option

    case $option in
    1)  
        if [ "$opt_1_cond" -eq 0 ] ; then
            echo "Vamos a arrancar el servicio"
            sudo systemctl start "$service_name"
        else
            echo "Vamos a parar el servicio"
            sudo systemctl stop "$service_name"
        fi
        ;;
    2)
        if [ "$opt_2_cond" -eq 0 ] ; then
            echo "Vamos a deshabilitar el servicio"
            sudo systemctl disable "$service_name"
        else
            echo "Vamos a habilitar el servicio"
            sudo systemctl enable "$service_name"
        fi
        ;;
    3)
        if [ "$opt_3_cond" -eq 0 ] ; then
            echo "Vamos a enmascarar el servicio"
            sudo systemctl mask "$service_name"
        else
            echo "Vamos a desenmascarar el servicio"
            sudo systemctl unmask "$service_name"
        fi
        ;;
    4)
        echo "Esta es la configuración del servicio"
        systemctl show "$service_name"
        ;;
    5)
        echo "Vamos a reiniciar el servicio y dejarlo activado"
        sudo systemctl restart "$service_name"
        ;;
    6)
        echo "Vamos a reiniciar el servicio y dejarlo en su estado original"
        sudo systemctl try-restart "$service_name"
        ;;
    7)
        echo "Vamos a intentar aplicar los cambios en la configuración del servicio dejando el servicio activo"
        sudo systemctl reload-or-restart "$service_name"
        ;;
    8)
        echo "Vamos a intentar aplicar los cambios a la configuración dejando el servicio en su estado actual"
        sudo systemctl try-reload-or-restart "$service_name"
        ;;
    9)
        echo "Vamos a poner la configuración por defecto del desarrollador"
        sudo systemctl preset "$service_name"
        ;;
    10)
        echo "Este es el tiempo de arranque del sistema"
        systemd-analyze time
        ;;
    11)
        echo "Este es el tiempo de carga del servicio $service_name"
        systemd-analyze blame | grep "$service_name"
        ;;
    12)
        echo "Este es el nivel de ejecución actual del equipo"
        runlevel
        ;;
    13)
        echo "Vamos a apagar el equipo"
        sudo systemctl isolate runlevel0.target
        ;;
    14)
        echo "Vamos a reiniciar el equipo"
        sudo systemctl isolate runlevel6.target
        ;;
    15)
        echo "Saliendo del script"
        exit 0
        ;;
    *)
        service_manage_menu "$service_name" "$current_status" "$boot_status"
    ;;    
    esac
    
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
current_status=`systemctl is-active $service_name`
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

service_manage_menu "$service_name" "$current_status" "$boot_status"
