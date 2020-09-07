# Handles Python environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

export PATH="$HOME/Library/Python/3.7/bin:$PATH"

alias python="python3"
alias pip="pip3"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export PROJECT_HOME=$HOME/Code
source /usr/local/bin/virtualenvwrapper.sh
