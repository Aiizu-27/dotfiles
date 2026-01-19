#!/bin/bash

########################################
# Dotfiles installer — symlinks seguros
########################################

set -e

# --------------------------------------------------
# Rutas
# --------------------------------------------------
DOTFILES="$HOME/.dotfiles"
BACKUP="$HOME/.dotfiles_backup"

echo "🔗 Aplicando dotfiles desde: $DOTFILES"

mkdir -p "$BACKUP"
mkdir -p "$HOME/.config"

# --------------------------------------------------
# Función de enlace con backup
# --------------------------------------------------
link() {
    SRC="$1"
    DEST="$2"

    if [ ! -e "$SRC" ]; then
        echo "❌ No existe el origen: $SRC"
        return
    fi

    if [ -e "$DEST" ] || [ -L "$DEST" ]; then
        TS=$(date +"%Y%m%d-%H%M%S")
        echo "📦 Backup de $DEST"
        mv "$DEST" "$BACKUP/$(basename "$DEST").$TS"
    fi

    echo "➡️  $DEST → $SRC"
    ln -sfn "$SRC" "$DEST"
}

# --------------------------------------------------
# ZSH
# --------------------------------------------------
link "$DOTFILES/zsh/zshrc" "$HOME/.zshrc"

# --------------------------------------------------
# Alacritty
# --------------------------------------------------
link "$DOTFILES/alacritty" "$HOME/.config/alacritty"

# --------------------------------------------------
# i3
# --------------------------------------------------
link "$DOTFILES/i3" "$HOME/.config/i3"

# --------------------------------------------------
# Picom
# --------------------------------------------------
mkdir -p "$HOME/.config/picom"
link "$DOTFILES/picom/picom.conf" "$HOME/.config/picom/picom.conf"

# --------------------------------------------------
# Polybar
# --------------------------------------------------
link "$DOTFILES/polybar" "$HOME/.config/polybar"

# --------------------------------------------------
# Ranger
# --------------------------------------------------
link "$DOTFILES/ranger" "$HOME/.config/ranger"

# --------------------------------------------------
# Rofi
# --------------------------------------------------
link "$DOTFILES/rofi" "$HOME/.config/rofi"

# --------------------------------------------------
# Dunst
# --------------------------------------------------
link "$DOTFILES/dunst" "$HOME/.config/dunst"

# --------------------------------------------------
# Final
# --------------------------------------------------
echo ""
echo "✅ Dotfiles enlazados correctamente."
echo "📦 Backups guardados en: $BACKUP"
