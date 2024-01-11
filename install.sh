#!/usr/bin/env bash

DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd)"
echo $DIR

ln -s "$DIR/.bash_profile" "$HOME/.bash_profile"
# ln -s "$DIR/.bashrc" "$HOME/.bashrc"
ln -s "$DIR/.gitconfig" "$HOME/.gitconfig"
# ln -s "$DIR/.inputrc" "$HOME/.inputrc"
ln -s "$DIR/.zshrc" "$HOME/.zshrc"

echo "Installing zsh."
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"