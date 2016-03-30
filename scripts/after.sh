#!/usr/bin/env bash
set -eu

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

# -----------------------------------------------------------------------------
log "creating .zshrc.local"
[ -f ~/.oh-my-zsh/custom/local.zsh ] || echo "source  ~/dotfiles/.zshrc.local" >> ~/.oh-my-zsh/custom/local.zsh

# -----------------------------------------------------------------------------
log "setting up dracula color scheme"
[ -d ~/dracula-theme ] || git clone https://github.com/zenorocha/dracula-theme/ ~/dracula-theme
[ -d ~/.oh-my-zsh/themes/dracula.zsh-theme ] || ln -s ~/dracula-theme/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

# -----------------------------------------------------------------------------
log "setting up  .vimrc"

[ -d ~/.config/nvim ] || mkdir ~/.config/nvim
[ -d ~/.config/nvim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
[ -f ~/.config/nvim/init.vim ] || echo "source  ~/dotfiles/.vimrc.local" >> ~/.config/nvim/init.vim
nvim +PluginInstall +qall


# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s

