#!/bin/bash
#Muestra volumen y estado de mute para Polybar
VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

if [ "$MUTE" = "true" ]; then
    echo "Mute"
else
    echo "$VOL%"
fi