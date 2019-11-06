# Handles fzf (Fuzzy Finder) theme configuration.
#
#       https://github.com/junegunn/fzf
#
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

fzf_file="$HOME/.fzf.zsh"
if [ -f "$fzf_file" ]; then
  source "$fzf_file"
else
  warn "fzf source file (\`$fzf_file\') cannot be found; not loading configuration." >&2
  return
fi
