export ZSH="/Users/spencerschack/.oh-my-zsh"
export VISUAL="code -w"
export EDITOR="$VISUAL"

plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias howdoi="howdoi -n5"

alias snow="/Applications/SnowSQL.app/Contents/MacOS/snowsql"

alias d="cd ~/Shareably/sbly-dash"
alias c="cd ~/Shareably/sbly-dash-collector"
alias w="cd ~/Shareably/sbly-wp"
alias s="npm start"

alias commitdotfiles="cd ~ && git ac \"Sync: `date`\" && git pf && cd -"
alias zshrc="code ~/.zshrc -w && source ~/.zshrc && commitdotfiles"
alias gitconfig="code ~/.gitconfig -w && commitdotfiles"

autoload -U promptinit; promptinit
prompt pure

autoload -U compinit; compinit

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
