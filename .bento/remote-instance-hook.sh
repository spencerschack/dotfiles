#!/bin/bash

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" > ~/.zshrc.d/zsh-autosuggestions.zsh

curl -L -o ~/.local/bin/open https://raw.githubusercontent.com/superbrothers/opener/master/bin/open

alias open="~/.local/bin/open"

echo "StreamLocalBindUnlink yes" | sudo tee /etc/ssh/sshd_config.d/opener.conf

sudo systemctl restart ssh
