#!/bin/bash

# Argumentos

if [ "$#" -ne 3 ]; then
echo "Uso: $0 nombre_maquina tama_vol red"
exit 1
fi

# Variables

nombremaquina="$1"
tamavol="$2"
nombrered="$3"

# Plantilla

# Crear nuevo vol

echo "Creando disco"

sudo virsh -c qemu:///system vol-create-as discos $nombremaquina.qcow2 "${tamavol}G" --format qcow2 --backing-vol practica.qcow2 --backing-vol-format qcow2

# Cambiar el hostname de la maquina

sudo virt-customize -c qemu:///system -a /srv/images/$nombremaquina.qcow2 --hostname $nombremaquina

# Redimension de la imagen

sudo cp /srv/images/$nombremaquina.qcow2 /srv/images/nuevo$nombremaquina.qcow2

sudo virt-resize --expand /dev/sda1 /srv/images/nuevo$nombremaquina.qcow2 /srv/images/$nombremaquina.qcow2

sudo rm /srv/images/nuevo$nombremaquina.qcow2

# Creacion de maquina

echo "Creando maquina"

virt-install --connect qemu:///system \
--noautoconsole \
--virt-type kvm \
--name $nombremaquina \
--os-variant debian11 \
--disk path=/srv/images/$nombremaquina.qcow2,size=$tamavol,format=qcow2 \
--memory 1024 \
--vcpus 1 \
--import \
--network bridge=$nombrered

# Conexión a la maquina

echo "Conectando a maquina"

sudo virt-viewer -c qemu:///system $nombremaquina

echo "Creacion de $nombremaquina con la red $nombrered exitosa."