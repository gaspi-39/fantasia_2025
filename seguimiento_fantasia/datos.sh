#!/bin/bash
echo "== Ingrese Datos =="

echo "Dia (dd/mm/aaaa):"
read fecha

echo "Nombre del empleado (Solo nombre y con minusculas.):"
echo "En caso de necesitar diferenciar por apellido, ingrese su nombre seguido de la primera letra del apellido"
read empleado

echo "Relacion con los pares (1-10):"
read pares

echo "Relacion con superiores (1-10):"
read superiores

echo "Relacion con los niños (1-10):"
read subordinados

echo "Desempeño de tareas (1-10):"
read tareas

echo "Imagen personal (1-10):"
read imagen

total=$((pares + superiores + subordinados + tareas + imagen))
echo " "

cd personal

if [ $total -ge 35 ]; then {
    echo "!Buen desempeño!" " dia: $fecha" >> $empleado.txt
    cd ..
    cd telegram_bot
    echo "$empleado tuvo un buen rendimiento el dia $fecha" > mensaje.txt
    cd ..
    cd personal
} else {
    echo "Desempeño mejorable." " dia: $fecha" >> $empleado.txt
    cd ..
    cd telegram_bot
    echo "$empleado tuvo un rendimiento mejorable el dia $fecha" > mensaje.txt
    cd ..
    cd personal
    exit 1 
}
fi
cd ..
cd telegram_bot
echo "== Datos guardados =="
./telegram.sh
echo ""
echo "== Enviando mensaje a Telegram =="
echo "== Mensaje enviado =="