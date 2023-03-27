#!/bin/bash
SHARED_DIR="$HOME/git/configs"

FILES=(".bashrc" ".bash_aliases" ".vimrc" ".tmux.conf")
for file in "${FILES[@]}"; do
    cp "$HOME/$file" "$SHARED_DIR/$file"
    echo "copied $file to $SHARED_DIR"
done
