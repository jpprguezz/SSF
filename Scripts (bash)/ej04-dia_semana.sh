#!/bin/bash

dia=$1
mes=$2
anio=$3

fecha=$(date -d $anio-$mes-$dia +"%A")

echo "El día $dia/$mes/$anio es o fue $fecha"