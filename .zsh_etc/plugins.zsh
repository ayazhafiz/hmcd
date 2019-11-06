# Handles ZSH plugin configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

plugins=(git
         zsh-autosuggestions
         zsh-completions
         zsh-syntax-highlighting
         alias-tips)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ZSH completions
autoload -U compinit; compinit
