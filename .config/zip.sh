#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"

# https://superuser.com/questions/312301/unix-zip-directory-but-excluded-specific-subdirectories-and-everything-within-t
rm -rf $DROPBOX/site.zip
(
	cd "$HOME/.local/share/nvim" && zip -r -q "$DROPBOX/site.zip" site \
		-x "*/nvim-treesitter/parser/**" \
		-x "*/blink.cmp/target/release/**"
)
