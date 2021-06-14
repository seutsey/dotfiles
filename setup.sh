#!/bin/sh
# This should be run from ~/.dotfiles. YOU fix the hardcodes if you don't like 'em.
cd
ln -s ~/.dotfiles/bash_completions .bash_completions
ln -s ~/.dotfiles/dotbash_functions .bash_functions
ln -s ~/.dotfiles/dotaliases .aliases
ln -s ~/.dotfiles/dotngrok .ngrok
#ln -s ~/.dotfiles/dotemacs.el .emacs
ln -s ~/.dotfiles/dotvimrc .vimrc
ln -s ~/.dotfiles/dotirbrc .irbrc
ln -s ~/.dotfiles/dotbash_profile .bash_profile
ln -s ~/.dotfiles/dotbashrc .bashrc
ln -s ~/.dotfiles/dotprofile .profile
ln -s ~/.dotfiles/dottmux.conf .tmux.conf
ln -s ~/.dotfiles/dotemacstiny.el .emacstiny
ln -s ~/.dotfiles/dotvimrc.after .vimrc.after
ln -s ~/.dotfiles/dotjshintrc .jshintrc
ln -s ~/.dotfiles/dotspacemacs .spacemacs
ln -s ~/.dotfiles/git-completion.bash .git-completion.bash
ln -s ~/.dotfiles/dotgit-prompt.sh .git-prompt.sh
cd ~/.dotfiles

# Change Zsh to Bash
#chsh -s /bin/bash
