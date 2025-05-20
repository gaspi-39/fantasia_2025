#!/bin/bash
echo "== Calculo de promedio =="
echo "Nombre del empleado (Solo nombre y con minusculas.):"
read empleado
cd personal
# Contar el número de líneas que contienen "Buen desempeño" en el archivo del empleado
puntaje=$(grep -o "Buen desempeño" $empleado.txt | wc -l)
# Contar el número de líneas que contienen "Desempeño mejorable" en el archivo del empleado
lineas=$(wc -l < $empleado.txt)
promedio=$(($puntaje * 100 / $lineas))
echo "El promedio de $empleado es: $promedio""%"
cd ..
cd telegram_bot
echo "$empleado tiene un promedio de $promedio% en su rendimiento global" > mensaje.txt
./telegram.sh
echo ""
echo "== Promedio calculado =="
cd ..
