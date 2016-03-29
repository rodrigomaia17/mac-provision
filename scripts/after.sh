#!/usr/bin/env bash
set -eu

log () {
  local fmt="» $1\n"; shift;
  tput setaf 2; printf "\n$fmt" "$@"; tput sgr0;
}

# ------------------------------------------------------------------------------
log "Installing latest ruby…"
TMP_RC=$(mktemp -t rcfile); cat << EOF > $TMP_RC
    LATEST_RUBY=\$(curl -s  https://raw.githubusercontent.com/postmodern/ruby-versions/master/ruby/versions.txt | sort | tail -n1)
    export RBENV_ROOT=/usr/local/var/rbenv
    eval "\$(rbenv init -)"

    rbenv install \$LATEST_RUBY --skip-existing
    rbenv global \$LATEST_RUBY

    rm -f $TMP_RC
EOF
zsh --rcs $TMP_RC
unset TMP_RC

# ------------------------------------------------------------------------------
log "Installing latest nodejs…"
TMP_RC=$(mktemp -t rcfile); cat << EOF > $TMP_RC
    source \$(brew --prefix nvm)/nvm.sh
    nvm install stable
    nvm alias default stable

    rm -f $TMP_RC
EOF
zsh --rcs $TMP_RC
unset TMP_RC

# ------------------------------------------------------------------------------
log "Cleaning up brew…"
brew linkapps
brew prune
brew cleanup --force -s

