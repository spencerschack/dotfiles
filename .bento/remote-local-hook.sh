#!/bin/bash

scp -r ~/.zshrc.d $REMOTE_HOST:~/.zshrc.d
scp ~/.gitconfig $REMOTE_HOST:~/.gitconfig
