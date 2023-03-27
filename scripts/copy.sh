#!/bin/bash
SHARED_DIR="$HOME/git/configs"

FILES=(".bashrc" ".aliases" ".vimrc" ".tmux.conf")
for file in "${FILES[@]}"; do
    cp "$HOME/$file" "$SHARED_DIR/$file"
    echo "copied $HOME/$file to $SHARED_DIR"
done
