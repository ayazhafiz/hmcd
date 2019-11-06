# Handles Yarn environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# yvm configuration
#       https://github.com/tophat/yvm
export YVM_DIR="$HOME/.yvm"
yvm_file="$YVM_DIR/yvm.sh"
if [ -r "$yvm_file" ]; then
  source "$yvm_file"
else
  warn "yvm source file (\`$yvm_file\') cannot be found; not loading configuration." >&2
  return
fi
