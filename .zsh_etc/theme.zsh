# Handles ZSH theme configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_IGNORE_TERM_COLORS=true

# Load prompt theme
autoload -U promptinit; promptinit

# Use pure color scheme and theme
PURE_GIT_PULL=1
source "$HOME/.purepower"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
