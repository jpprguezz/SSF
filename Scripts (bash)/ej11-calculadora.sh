#!/bin/bash
valor1=$1
valor2=$2

if [ $# -ne 2 ]
then
    echo "No has introducido un valor correcto"
    exit 
fi

select option in "Suma" "Resta" "Multiplicación" "División"
do 
    case $option in
        "Suma") echo "$valor1 + $valor2 = $(($valor1+$valor2))" ;;
        "Resta") echo "$valor1 - $valor2 = $(($valor1+$valor2))";;
        "Multiplicación") echo "$valor1 + $valor2 = $(($valor1+$valor2))" ;;
        "División") echo "$valor1 + $valor2 = $(($valor1+$valor2))" ;;
        #No se me ocurrieron más casos
    esac
    break