#!/usr/bin/env bash

FISH_DOT_DIR="$( cd "$( dirname "$0" )" && pwd )"

which stow
if [ $? = 0 ]
then
    ln -sf ${FISH_DOT_DIR}/fisherman/fisher.fish ${FISH_DOT_DIR}/fish/.config/fish/functions/fisher.fish
    stow -d ${FISH_DOT_DIR} -t ${HOME} fish
else
    echo "Please install stow before installation"
fi
