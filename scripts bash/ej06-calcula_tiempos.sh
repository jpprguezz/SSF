#!/bin/bash


total_segundos=$1


dias=$((total_segundos/86400))
segundos=$((total_segundos%86400))

horas=$((segundos/3600))
segundos=$((segundos%3600))

minutos=$((segundos/60))
segundos=$((segundos%60))


echo "$total_segundos segundos son $dias días, $horas horas, $minutos minutos, $segundos segundos."