# provision-osx 

Development enviornment provisioning scripts to run after a fresh OSX install.

# Install

`git clone git@github.com:freshstacks/provision-osx.git && cd provision-osx && make`

- `git clone git@github.com:freshstacks/provision-osx.git` - clone repo
- `cd provision-osx` - move CWD to repo
- `make` - run provision script

# Features

The provision script will ask you to confirm adding each feature before modifying your system.

- Sets Vim friendly keyboard preferences for key repeat and key delay (a logout is required before it takes effect)
- Installs Oh-My-Zsh
- Installs Homebrew
- Installs Node.js and NPM using [n](https://www.npmjs.com/package/n)
- Installs aws-cli
- Installs aws-sam-cli
- sources the "shell-additions" folder in ~/.zshrc
    - Aliases, completions, path additions and prompt style update
