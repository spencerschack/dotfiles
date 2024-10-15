eval "$(/opt/homebrew/bin/brew shellenv)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/autojump/autojump.zsh

export ZSH="/Users/spencerschack/.oh-my-zsh"
export VISUAL="code -w"
export EDITOR="$VISUAL"
export PATH=$HOME/.bin:$PATH:./bin:$HOME/Library/Python/3.7/bin
export CARROT_DIR="~/carrot"

export HOMEBREW_NO_ANALYTICS=1

export SNOWFLAKE_ACCOUNT='instacart'
export SNOWFLAKE_USER='spencerschack'
export SNOWFLAKE_PRIVATE_KEY=$(cat ~/.ssh/rsa_key.pem | tail -n +2 | head -n 25 | perl -p -e 'chomp if eof')
export SNOWFLAKE_DB="catalog_dev"

export MY_INSTACART_EMAIL='spencer.schack@instacart.com'
export GITHUB_USERNAME=spencerschack

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias howdoi="howdoi -n5 -a"
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
unalias g
g() {
  for command in "$@"
  do
    git $command
  done
}

alias commitdotfiles="cd ~ && git ac \"Sync: `date`\" && git pf && cd -"
alias zshrc="code ~/.zshrc -w && source ~/.zshrc && commitdotfiles"
alias brewfile="code ~/.Brewfile -w && brew bundle --global && commitdotfiles"
alias gitconfig="code ~/.gitconfig -w && commitdotfiles"

autoload -U promptinit; promptinit
PROMPT='%F{blue}%$%f'

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

alias t="cd ~/Instacart/tf-instacart"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -d ~/.zshrc.d ]; then
    for i in $(find $HOME/.zshrc.d/ -name '*.zsh' -o -name '*.sh' | sort); do
        . $i
    done
    unset i
fi

# BENTO_COMPLETIONS_START
export BENTO_COMPLETIONS_VERSION=2

autoload -U compinit; compinit
source <(bento completion zsh --silent)
export PGHOST=localhost # Set PGHOST to talk to bento postgres

# BENTO_COMPLETIONS_END



### BEGIN--Instacart Shell Settings. (Updated: Tue Aug  6 10:15:13 PDT 2024. [Script Version 1.3.27])
# This Line Added Automatically by Instacart Setup Script
# The sourced file contains all of the instacart utilities and shell settings
# To remove this functionality, leave the block, and enter "NO-TOUCH" in the BEGIN line, and comment the line below:
source /Users/spencerschack/.instacart_shell_profile
### END--Instacart Shell Settings.
