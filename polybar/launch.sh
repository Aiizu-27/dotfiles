#!/bin/bash

# Mata barras antiguas
killall -q polybar

# Espera que se cierren
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lanza la barra
polybar mybar &
echo "Polybar launched"