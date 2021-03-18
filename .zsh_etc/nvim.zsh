# Handles Neovim environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

if ! [ -x "$(command -v nvim)" ]; then
  warn "Neovim (\`nvim\') is not installed; not loading configuration." >&2
  return
fi

export NVIM_CONFIG_PATH="$HOME/.config/nvim"
export NVIM_SHARE_PATH="$HOME/.local/share/nvim"

# Flatten nested vim instances
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL="nvr --remote-tab-wait +'set bufhidden=wipe'"
else
  export VISUAL="nvim"
fi
alias vim="$VISUAL"
export EDITOR="$VISUAL"
alias vt="vim +term"
