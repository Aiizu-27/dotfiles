#!/bin/bash
#Muestra salida de audio activa
SINK=$(pactl info | grep "Default Sink" | cut -d " " -f3)
echo "$SINK"