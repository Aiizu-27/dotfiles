#!/bin/bash

# Definimos dónde se guardan los plugins (ruta estándar de Oh My Zsh)
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

echo "🚀 Iniciando instalación de plugins para Zsh..."

# --- PLUGIN 1: Autosuggestions ---
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "📦 Descargando zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "✅ zsh-autosuggestions ya está instalado."
fi

# --- PLUGIN 2: Syntax Highlighting ---
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "📦 Descargando zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting ya está instalado."
fi

echo ""
echo "🎉 ¡Todo listo! Reinicia tu terminal o ejecuta 'source ~/.zshrc' para ver los cambios."