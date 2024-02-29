#!/bin/bash
##############################################################################
# Nombre: Script_Procesos.sh
# Autores: José Manuel Peña Rodríguez y Miguel Ángel García Rodríguez
#
# Objetivo: Gestionar Procesos 
#
# Entradas: maxCPU, maxMem
# Salidas: Resultado de la opción seleccionada
#
# Historial:
#   2023-02-25: version 1.0
#############################################################################

read -p "Introduzca el máximo porcentaje de CPU: " maxCPU
if [[ -z $maxCPU ]]; then
    echo "ERROR 100: Debes introducir el porcentaje máximo de CPU para continuar"
    exit 100
fi 

if [[ "$maxCPU" -lt 0 ]]; then
    echo "ERROR 200: maxCPU debe ser mayor o igual que cero"
    exit 200
fi

read -p "Introduzca el máximo porcentaje de memoria: " maxMem
if [[ "$maxMem" -gt 100 ]]; then
    echo "ERROR 150: El porcentaje máximo de memoria debe de estar entre 0 y 100"
    exit 100
fi
if [[ -z $maxMem ]]; then
    echo "ERROR 100: Debes introducir el porcentaje máximo de memoria para continuar"
    exit 100
fi

if [[ "$maxMem" -lt 0 ]]; then
    echo "ERROR 200: maxMem debe ser mayor o igual que cero"
    exit 200
fi
real_max_cpu=$(ps aux | tr -s ' ' | cut -d ' ' -f 3 | sort -n | tail -n 1)
real_max_mem=$(ps aux | tr -s ' ' | cut -d ' ' -f 4 | sort -n | tail -n 1)
if [[ "$(echo "$real_max_cpu > $maxCPU" | bc)" -eq 1 ]]; then
    pid=$(ps aux | tr -s ' ' | cut -d ' ' -f 2,3 | sort -n -k 2 | tail -n 1 | cut -d ' ' -f 1)
    echo "                   ┌────────────────┐"
    echo "                   │    M E N U     │"
    echo "                   └────────────────┘"
    echo "┌──────────────────────────────────────────────────────────────────────────┐"
    echo "1- Ignorar el aviso y seguir comprobando"
    echo "2- Disminuir en 3 puntos la prioriodad del proceso"
    echo "3- Interrumpir el proceso"
    echo "4- Terminar el proceso"
    echo "5- Finalizar inmmediatamente el proceso"
    echo "6- Detener el proceso ("congerlarlo" de forma evitable)"
    echo "7- Detener el proceso ("congelarlo de forma inevitable")"
    echo "└──────────────────────────────────────────────────────────────────────────┘"
    read -p "Introduzco su la opcion que desee: " opcion
    case "$opcion" in
        1)
        echo "Continuando proceso..."
        ;;
        2)
        renice +5 $pid 
        ;;
        3)
        sudo kill -s SIGINT $pid
        ;;
        4)
        sudo kill -s SIGTERM $pid
        ;;
        5)
        sudo kill -s SIGKILL $pid
        ;;
        6)
        sudo kill -s SIGSTOP $pid
        ;;
        7)
        sudo kill -s SIGTSTP $pid
        ;;
    esac
fi

if [[ "$(echo "$real_max_mem > $maxMem" | bc)" -eq 1 ]]; then
    pid=$(ps aux | tr -s ' ' | cut -d ' ' -f 2,4 | sort -n -k 2 | tail -n 1 | cut -d ' ' -f 1)

    read -p "Introduzco su la opcion que desee (elige entre las opciones de la 1 a la 5): " opcion
    case "$opcion" in
        1)
        echo "Continuando proceso..."
        ;;
        2)
        sudo kill -s SIGINT $pid
        echo "Iterrumpiendo ejecución..."
        exit 0
        ;;
        3)
        sudo kill -s SIGTERM $pid
        echo "Finalizando ejecución..."
        exit 0
        ;;
        4)
        sudo kill -s SIGURS1 $pid
        ;;
        5)
        sudo kill -s SIGURS2 $pid
        ;;
    esac
fi