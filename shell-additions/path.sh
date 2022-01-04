#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

PATH="/opt/homebrew/bin:./node_modules/.bin:$HOME/.npm-global/bin:$SCRIPT_DIR/home/bin:$PATH"
 