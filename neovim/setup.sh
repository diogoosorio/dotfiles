#!/usr/bin/env bash

# Install VimPlug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Copy init.vim
cp ./init.vim ~/.config/nvim/init.vim
