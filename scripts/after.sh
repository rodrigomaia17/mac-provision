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
log "setting up syntax highlighting"
[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] ||  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
# -----------------------------------------------------------------------------
log "setting up dracula color scheme"
[ -d ~/dracula-theme ] || git clone https://github.com/zenorocha/dracula-theme/ ~/dracula-theme
[ -f ~/.oh-my-zsh/themes/dracula.zsh-theme ] || ln -s ~/dracula-theme/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

# -----------------------------------------------------------------------------
log "setting up  .vimrc"

[ -d ~/.config/nvim ] || mkdir ~/.config/nvim
[ -d ~/.config/nvim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
[ -f ~/.config/nvim/init.vim ] || echo "source  ~/dotfiles/.vimrc.local" >> ~/.config/nvim/init.vim
nvim +PluginInstall +qall


# -----------------------------------------------------------------------------
log "creating .tmux.conf"
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
[ -f ~/.tmux.conf ] || echo "source-file  ~/dotfiles/.tmux.conf" >> ~/.tmux.conf

# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s

