#!/bin/bash
##############################################################################
# Nombre: Script_Procesos.sh
# Autores: José Manuel Peña Rodríguez y Miguel Ángel
#
# Objetivo: Gestionar Procesos 
#
# Entradas: maxCPU, maxMem
# Salidas: Resultado de la opción seleccionada
#
# Historial:
#   2023-02-25: version 1.0
#############################################################################

maxCPU=$1 
maxMem=$2 
if [[ -z $1 or $2 ]]; then
    echo 'Error'

read -p "Introduzca el maximo de porcentaje de CPU: " maxCPU
read -p "Introduzca el maximo de porcentaje de memoria: " maxMem
