#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"

rm -rf $DROPBOX/site.zip
cp -rf $HOME/.local/share/nvim/site /tmp/site

# treesitter
rm -rf /tmp/site/pack/deps/opt/nvim-treesitter/parser/*

zip -q -r $DROPBOX/site.zip /tmp/site
rm -rf /tmp/site
