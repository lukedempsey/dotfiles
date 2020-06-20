#!/bin/sh

#add useful packages
sudo apt-get update && sudo apt-get install -y \
    vim \
    tmux \
    git \
    wget \
    zsh \
    python3-pip

#for python navigation in vim
pip3 install jedi

#setup zsh
chsh -s /usr/bin/zsh root

#oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

#install FZF (fuzzy finder on the terminal and used by a Vim plugin).
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#install plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

#install node
curl -sL install-node.now.sh/lts | sudo bash

#remove existing dotfiles
mkdir ~/old_dotfiles
mv ~/.aliases ~/old_dotfiles/.aliases
mv ~/.vimrc ~/old_dotfiles/.vimrc
mv ~/.zshrc ~/old_dotfiles/.zshrc
mv ~/.tmux.conf ~/old_dotfiles/.tmux.conf

#create symlinks to dotiles
ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
