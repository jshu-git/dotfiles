#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"
rm -rf $DROPBOX/site.zip
(
	cd "$HOME/.local/share/nvim" && zip -r -q "$DROPBOX/site.zip" site \
		-x "*/nvim-treesitter/parser/**" \
		-x "*/blink.cmp/target/release/**"
)
