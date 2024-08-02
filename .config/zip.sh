#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"

rm -rf $DROPBOX/lazy.zip
cp -rf $HOME/.local/share/nvim/lazy /tmp/lazy

# treesitter
rm -rf /tmp/lazy/nvim-treesitter/parser/*

zip -q -r $DROPBOX/lazy.zip /tmp/lazy
rm -rf /tmp/lazy
