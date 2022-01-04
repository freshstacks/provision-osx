#!/usr/bin/env bash

alias g="git"

alias ga="git add"
alias gaa="git add -A"

alias gb="git branch --sort=-committerdate"

alias gc="git checkout"
alias gcb="git checkout -b"

alias gg="git log --color --graph --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl="git log --color --pretty=format:'%C(yellow)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias gpf="git push -f"

alias gcm="git commit -m"
alias gca='[ -z "$(git status --porcelain)" ] && echo "already up to date" || git commit --amend --no-edit'

alias gd="git diff --patch-with-stat"
alias gdc="git diff --cached --patch-with-stat"
alias gdm="git diff --cached --patch-with-stat main"

alias gs="git status"

alias gclean="git clean -df"
alias gupdate="git submodule update --recursive"
alias gsize="git gc > /dev/null 2>&1 && git count-objects -vH | grep size-pack"

function since() {
    ref="$1"
    while [ "$ref" = "" ]; do
        printf "source ref: "
        read ref
    done
    git --no-pager diff "$ref" --stat
}