#!/usr/bin/env bash

root="$PWD"
forceconfirm="$1"

if [[ "$(defaults read NSGlobalDomain "InitialKeyRepeat")" -ne 10 ]]; then
    read -p "Set optimal key-repeaat settings for VIM?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        defaults write -g InitialKeyRepeat -int 10
        defaults write -g KeyRepeat -int 1
        defaults write -g ApplePressAndHoldEnabled -bool false
        defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
        defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
        defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false
        defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
    else
        echo "Skipping optimal vim key-repeaat settings"
    fi
else
    echo "* optimal vim key-repeat settings already set"
fi

if ! [ -d "$HOME/.oh-my-zsh" ]; then
    read -p "Install oh-my-zsh?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "* Skipping oh-my-zsh install"
    fi
else
    echo "* oh-my-zsh is already installed"
fi

if ! command -v "brew" >/dev/null 2>&1; then
    read -p "Install brew?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        brew analytics off
    else
        echo "* Skipping homebrew install"
    fi
else
    echo "* Homebrew is already installed"
fi

if ! command -v "node" >/dev/null 2>&1; then
    read -p "Install Node.js?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        curl -L https://bit.ly/n-install | bash
    else
        echo "* Skipping Node.js install"
    fi
else
    echo "* Node.js is already installed"
fi

if ! command -v /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome >/dev/null 2>&1; then
    read -p "Install google chrome browser?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        wget https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
        open ~/Downloads/googlechrome.dmg
        sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/
    else
        echo "* Skipping Chrome install"
    fi
else
    echo "* Chrome browser is already installed"
fi

if command -v "brew" >/dev/null 2>&1; then
    if ! command -v "aws" >/dev/null 2>&1; then
        read -p "Install aws-cli?: (y/N) " confirm
        if [ "$confirm" = "y" ]; then
            brew install awscli
        else
            echo "* Skipping aws-cli install"
        fi
    else
        echo "* aws-cli is already installed"
    fi
    if ! command -v "sam" >/dev/null 2>&1; then
        read -p "Install aws-sam-cli?: (y/N) " confirm
        if [ "$confirm" = "y" ]; then
            brew install aws-sam-cli
        else
            echo "* Skipping aws-sam-cli install"
        fi
    else
        echo "* aws-sam-cli is already installed"
    fi
fi

shelladditionspath="$root/shell-additions"

if [ -f "$HOME/.zshrc" ] && ! grep -q "$shelladditionspath" "$HOME/.zshrc"; then
    read -p "Install shell-additions?: (y/N) " confirm
    if [ "$confirm" = "y" ]; then
        echo "" >>"$HOME/.zshrc"
        echo "# Shell Additions by Freshstack" >>"$HOME/.zshrc"
        echo "for f in $shelladditionspath/*; do source \$f; done" >>"$HOME/.zshrc"
    else
        echo "shell-additions not installed"
    fi
else
    echo "* shell-additions already sourced"
fi
