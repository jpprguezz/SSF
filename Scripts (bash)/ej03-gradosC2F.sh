#!/bin/bash

celsius=$1

# version para puntos flotante 
fahrenheit=$(echo "scale=2; $celsius * 1.8 + 32" | bc)

#version para enteros 
fahrenheit=$((celsius * 9/5 + 32))

echo "Grados Celsius: $celsius °C"
echo "Grados Fahrenheit: $fahrenheit °F"