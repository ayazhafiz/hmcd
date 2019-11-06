# Handles environment secrets configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

secrets_file="$HOME/.secrets"
if [ -f "$secrets_file" ]; then
  source "$secrets_file"
else
  warn "secrets file (\`$secrets_file\') cannot be found; not loading configuration." >&2
  return
fi
