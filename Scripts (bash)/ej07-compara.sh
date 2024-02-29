#!/bin/bash

if [ "$1" == "" ]; then
    echo Debe introducir el primero numero
    read input
    num1=$input
if [ "$2" == "" ]; then
    echo Debe introducir el segundo numero
    read input
    num2=$input
else
    num=$1
    num=$2

if [ "$num1" -eq "$num2" ]; then
    echo "Los números son iguales."
elif [ "$num1" -gt "$num2" ]; then
    echo "$num1 es mayor que $num2."
else
    echo "$num2 es mayor que $num1."
fi