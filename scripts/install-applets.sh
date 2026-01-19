#!/bin/bash

# Actualizar repos y asegurarse de que tenemos permisos de sudo
echo "Instalando paquetes necesarios..."

# Instalar nm-applet y blueman si no están instalados
if ! command -v nm-applet &> /dev/null; then
    sudo pacman -S --noconfirm networkmanager-applet
fi

if ! command -v blueman-applet &> /dev/null; then
    sudo pacman -S --noconfirm blueman
fi

echo "Arrancando los applets..."

# Comprobar si ya están corriendo y arrancarlos si no
pgrep -x nm-applet > /dev/null || nm-applet &
pgrep -x blueman-applet > /dev/null || blueman-applet &

echo "¡Listo! Los applets deberían estar corriendo."
