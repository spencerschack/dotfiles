export ZSH="/Users/spencerschack/.oh-my-zsh"
export VISUAL="code -w"
export EDITOR="$VISUAL"
export PATH=$HOME/.bin:$PATH:./bin
export AIRFLOW_HOME=~/Shareably/airflow

plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias howdoi="howdoi -n5"

alias snowsql="/Applications/SnowSQL.app/Contents/MacOS/snowsql"

alias x="xargs -n1 -I%"
alias k="kubectl"
alias s="snowsql"
alias d="cd ~/Shareably/sbly-dash"
alias c="cd ~/Shareably/sbly-dash-collector"
alias w="cd ~/Shareably/sbly-wp"
alias a="cd ~/Shareably/sbly-scheduler"
alias r="npm run repl"
alias e="npm run run-dev"
json() {
  jq -C $* | less -R
}
manp() {
  man -t $1 | open -f -a Preview
}
sum() {
  ruby -e "puts STDIN.each_line.map(&:to_f).sum"
}

alias commitdotfiles="cd ~ && git ac \"Sync: `date`\" && git pf && cd -"
alias zshrc="code ~/.zshrc -w && source ~/.zshrc && commitdotfiles"
alias gitconfig="code ~/.gitconfig -w && commitdotfiles"

autoload -U promptinit; promptinit
prompt pure

autoload -U compinit; compinit

psqljson() {
  jq -c | psql -c "TRUCNATE TABLE json; COPY json FROM STDIN"
}

eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
