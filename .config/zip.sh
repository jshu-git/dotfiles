#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"

rm -rf $DROPBOX/lazy.zip
cp -rf $HOME/.local/share/nvim/lazy /tmp/lazy

# treesitter
rm -rf /tmp/lazy/nvim-treesitter/parser/*

zip -q -r /tmp/lazy.zip /tmp/lazy
mv /tmp/lazy.zip $DROPBOX/
rm -rf /tmp/lazy
