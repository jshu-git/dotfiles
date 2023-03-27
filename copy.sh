#!/bin/bash

SHARED_DIR="$HOME/git/configs"

cp ~/.bashrc "$SHARED_DIR/.bashrc"
cp ~/.bashrc "$SHARED_DIR/.bash_aliases"
cp ~/.vimrc "$SHARED_DIR/.vimrc"
cp ~/.tmux.conf "$SHARED_DIR/.tmux.conf"

echo "Configuration files copied to $SHARED_DIR"
