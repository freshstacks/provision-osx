#!/usr/bin/env bash

alias d="docker"

alias db="docker build"
alias dbx="docker buildx"

alias dd="docker dev"
alias ddl="docker dev list"
alias ddo="docker dev open"
alias dds="docker dev ls"
alias ddrm="docker dev rm"
alias ddrma='docker dev rm $(docker dev ls -q)'

alias de="docker exec -it"

alias di="docker images"
alias drmi="docker rmi"
alias drmia='docker rmi $(docker images -q)'

alias dn="docker network"
alias dns="docker network ls"

alias dsp="docker system prune -f"

alias ds='docker ps --format "table {{.ID}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'
alias dsa='docker ps -a --format "table {{.ID}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'

alias dv="docker volume"
alias dvs="docker volume ls"
alias dvp="docker volume prune --filter 'label!=freshstacks'"

alias dc="docker compose"
alias dcb="docker compose build"
alias dcd="docker compose down"
alias dcdv="docker compose down --volumes"
alias dce="docker compose exec"
alias dcl="docker compose logs"
alias dcu="docker compose up -d"
alias dcw="docker compose watch"
