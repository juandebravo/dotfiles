#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# First my bin, then homebrew, then...
PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin 

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# VirtualEnv
# ==========

# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true

# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE=$HOME/.python/.virtualenvs

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.python/.pip/cache

activate() {
    source $PIP_VIRTUALENV_BASE/$1/bin/activate
}

# Activate a virtualenv if exists one named as the current folder
venv_chpwd() {
    local project_path
    project_path=$(basename $PWD)
    [ -d $PIP_VIRTUALENV_BASE/$project_path ] || return
    print "Activating virtualenv $project_path"
    activate $project_path
}

# Change folder hook.
add-zsh-hook chpwd venv_chpwd
