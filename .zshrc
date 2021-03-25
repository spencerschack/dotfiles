export ZSH="/Users/spencerschack/.oh-my-zsh"
export VISUAL="code -w"
export EDITOR="$VISUAL"
export PATH=$HOME/.bin:$PATH:./bin:$HOME/Library/Python/3.7/bin

plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias howdoi="howdoi -n5"

alias x="xargs -n1 -I%"
alias v="code ."
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
  jq -c | psql -c "DROP TABLE IF EXISTS $1; CREATE TABLE $1 (record JSONB); COPY $1 FROM STDIN"
}

jsontable() {
  jq -r -s "
    [.[]| with_entries( .key |= ascii_downcase ) ]
        |    (.[0] |keys_unsorted | @tsv)
          , (.[]|.|map(.) |@tsv)
  " | column -t -s $'\t'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"



### BEGIN--Instacart Shell Settings. (Updated: Mon Mar 22 15:20:49 PDT 2021. [Script Version 1.2.11])
# This Line Added Automatically by Instacart Setup Script
# The sourced file contains all of the instacart utilities and shell settings
# To remove this functionality, leave the block, and enter "NO-TOUCH" in the BEGIN line, and comment the line below:
source /Users/spencerschack/.instacart_shell_profile
### END--Instacart Shell Settings.
