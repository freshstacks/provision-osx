#!/usr/bin/env bash

# Launch URL into Chrome browser
alias chrome="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias insecure-chrome="chrome --args --user-data-dir=/tmp/chrome_dev_test --disable-web-security"

# Get my local and public IP addresses
alias my-lan="ifconfig -l | xargs -n1 ipconfig getifaddr"
alias my-wan="dig @resolver4.opendns.com myip.opendns.com +short -4"

# VSCODE
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"