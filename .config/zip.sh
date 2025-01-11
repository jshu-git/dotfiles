#!/bin/bash

DROPBOX="$HOME/Library/CloudStorage/Dropbox"
rm -rf $DROPBOX/site.zip
(
	cd $HOME/.local/share/nvim && zip -r -q $DROPBOX/site.zip site \
		-x '*/pack/deps/opt/nvim-treesitter/parser/*' \
		-x '*/pack/deps/opt/blink.cmp/target/release/*'
)
