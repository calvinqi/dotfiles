#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

files="zprofile vimrc"
olddir=~/dotfiles_old
mkdir -p $olddir

# Symlinking Dotfiles
for file in $files; do
    if [ -f "$HOME/.$file" ]; then
        echo "Moving existing dotfile $file to $olddir"
        cp -f ~/.$file $olddir || true
    fi
    echo "Creating symlink to $file in home directory."
    ln -sf $SCRIPT_DIR/.$file $HOME/.$file
done

# Platform-specific
if [ "$(uname)" == "Darwin" ]; then
    source $SCRIPT_DIR/mac_config
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo 'Linux specific logic'
fi
