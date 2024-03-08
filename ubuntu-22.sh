#!/bin/bash

set -v
cd ~/

# Setup bin folder
mkdir bin
echo "export PATH=\"\$HOME/bin:\$PATH\"" >> .bashrc
source ./bashrc

# Install common deps
sudo apt update
sudo apt -y install curl git vim openssl

# install asdf 
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

echo ". \"\$HOME/.asdf/asdf.sh\"" >> .bashrc
echo ". \"\$HOME/.asdf/completions/asdf.bash\"" >> .bashrc

source ./.bashrc

# install erlang via asdf
sudo apt -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang latest
asdf global erlang latest

# install elixir via asdf
sudo apt-get install unzip
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest                      
