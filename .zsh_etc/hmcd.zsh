# Handles hmcd environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

if ! [ -x "$(command -v git)" ]; then
  warn "Git (\`git\') is not installed; not loading configuration." >&2
  return
fi

readonly HMCD_DIR=".hmcd"
readonly HMCD="git --git-dir=$HOME/$HMCD_DIR --work-tree=$HOME"
readonly GIT='\git'

function chpwd {
  if [ -d "$HMCD_DIR" ]; then
    alias git="$HMCD"
  else
    alias git="$GIT"
  fi
}
chpwd
