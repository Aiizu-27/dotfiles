#!/bin/bash
# Muestra volumen con barra visual en ASCII para Polybar

VOL=$(pamixer --get-volume)
MUTE=$(pamixer --get-mute)

# Limitar entre 0 y 100
if [ "$VOL" -gt 100 ]; then
    VOL=100
fi

# Número de bloques de la barra
BLOCKS=10
FILLED=$(( VOL * BLOCKS / 100 ))
EMPTY=$(( BLOCKS - FILLED ))

# Construir la barra ASCII
BAR=""
for ((i=0; i<FILLED; i++)); do
    BAR+="#"
done
for ((i=0; i<EMPTY; i++)); do
    BAR+="-"
done

# Mostrar resultado
if [ "$MUTE" = "true" ]; then
    echo "MUTE [$BAR]"
else
    echo "$VOL% [$BAR]"
fi
