#!/bin/bash

# 1. Matar las barras que ya estén corriendo para no duplicarlas
killall -q polybar

# 2. Esperar un poquito a que se cierren del todo
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. AQUÍ es donde la lanzas (esta es la línea importante)
# La 'y' comercial (&) al final es vital para que no se congele la terminal
polybar example &

echo "Polybar lanzada..."