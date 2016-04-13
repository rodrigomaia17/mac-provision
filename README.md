# bootstrap my OS X (including dotfiles) 
```
curl -Ls https://raw.githubusercontent.com/rodrigomaia17/mac-provisioning/master/setup | bash

```

Manual steps:
  - set the capslock to be ctrl
  - set the colorscheme dracula at iterm2 preferences
  - create the variable plugins at.zshrc: plugins=(git brew brew-cask npm tmux vagrant zsh_reload zsh-syntax-highlighting)
  - install fuze
  - install enigmail
  - install coy
  - install brew services
  - install node.js
  - install npm global packages (hackmyresume...)
  - setup iterm2 to use ctrl+h: 
      Edit -> Preferences -> Keys
      Press +
      Press Ctrl+h as Keyboard Shortcut
      Choose Send Escape Sequence as Action
      Type [104;5u for Esc+
