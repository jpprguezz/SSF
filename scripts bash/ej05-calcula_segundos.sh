#!/bin/bash

dias=$1
horas=$2
minutos=$3
segundos=$4

total_segundos=$((dias*86400 + horas*3600 + minutos*60 + segundos))

echo "$dias días, $horas horas, $minutos minutos y $segundos segundos son $total_segundos."