#!/bin/bash

cd $HOME/.local/share/nvim/lazy/
zip -q -r lazy .
rm -f $HOME/Library/CloudStorage/Dropbox/lazy.zip
mv lazy.zip $HOME/Library/CloudStorage/Dropbox/
