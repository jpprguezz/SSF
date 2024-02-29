#!/bin/bash

read -p "Indica tu peso: " peso
read -p "Indica tu altura: " altura

IMC=$(echo "scale=2; $peso / ($altura/100 * $altura/100)" | bc)

if (( $(echo "$IMC < 15" | bc -l) )); then
    clasificacion="Delgadez severa"
elif (( $(echo "$IMC < 17" | bc) )); then
    clasificacion="Delgadez moderada"
elif (( $(echo "$IMC < 20" | bc) )); then
    clasificacion="Delgadez leve"
elif (( $(echo "$IMC < 22" | bc) )); then
    clasificacion="Normal"
elif (( $(echo "$IMC < 24" | bc) )); then
    clasificacion="Preobesidad"
elif (( $(echo "$IMC < 26" | bc) )); then
    clasificacion="Obesidad leve"
elif (( $(echo "$IMC < 28" | bc) )); then
    clasificacion="Obesidad media"
else
    clasificacion="Obesidad severa"
fi

echo "IMC: $IMC"
echo "Clasificación: $clasificacion"
