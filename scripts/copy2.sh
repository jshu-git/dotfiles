#!/bin/bash
SHARED_DIR="$HOME/git/configs"

FILES=(".bashrc" ".aliases" ".vimrc" ".tmux.conf")
for file in "${FILES[@]}"; do
    cp "$SHARED_DIR/$file" "$HOME/$file" 
    echo "copied $SHARED_DIR/$file $HOME/$file"
done
