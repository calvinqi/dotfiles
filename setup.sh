#!/bin/bash
set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

files="zprofile vimrc"
olddir=~/dotfiles_old
mkdir -p $olddir

for file in $files; do
    if [ -f "~/.$file" ]; then
        echo "Moving existing dotfile $file to $olddir"
        mv ~/.$file $olddir
    fi
    echo "Creating symlink to $file in home directory."
    ln -sf $SCRIPT_DIR/.$file ~/.$file
done

source ~/.zprofile
