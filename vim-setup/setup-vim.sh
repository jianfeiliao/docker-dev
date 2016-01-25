#!/bin/bash

PATH=$PATH:/usr/local/go/bin

echo "Setting up vim"
echo "Installing Vundle"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
vi +PluginInstall +qall 
vi +GoInstallBinaries +qall

echo "Done"
