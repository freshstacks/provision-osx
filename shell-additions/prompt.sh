#!/usr/bin/env bash

git_branch_color() {
    if $(git rev-parse --is-inside-work-tree &>/dev/null); then
        local ST=$(git status --short 2>/dev/null)
        local BR=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD 2>/dev/null)
        if [ "$BR" = "HEAD" ]; then
            local NM=$(git name-rev --name-only HEAD 2>/dev/null)
            if [ "$NM" != undefined ]; then
                BR="@$NM"
            fi
        else
            BR=$(cut -d '_' -f 1 <<<"$BR")
        fi
        if [ -n "$BR" ]; then
            if [[ "$ZSH_VERSION" != "" ]]; then
                if [ -n "$ST" ]; then
                    printf "$fg_bold[red]"
                else
                    printf "$fg_bold[green]"
                fi
            fi
        fi
    fi
}

short_pwd() {
    if ! $(git rev-parse --is-inside-work-tree &>/dev/null); then
        echo "%~"
    fi
    git_root=$PWD
    while [[ $git_root != / && ! -d $git_root/.git ]]; do
        git_root=$git_root:h
    done
    prefix="$(git rev-parse --show-prefix  2> /dev/null)"
    shortpwd="%{$fg_bold[blue]%}$(basename "${git_root%.*}")%{$fg_bold[cyan]%}/$prefix"
    echo "${shortpwd::-1}"
}

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%B%F{green}%*%f %F{blue}$(short_pwd)%f $(git_branch_color)${vcs_info_msg_0_} 
❯ %{$reset_color%}'