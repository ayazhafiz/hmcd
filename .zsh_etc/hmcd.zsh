# Handles hmcd environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd
source "$ZSH_ETC/status_msg.zsh"

if $(type -P git 2>/dev/null); then
  warn "Git (\`git\') is not installed; not loading configuration." >&2
  return
fi

HMCD_DIR=".hmcd"
HMCD="git --git-dir=$HOME/$HMCD_DIR --work-tree=$HOME"
GIT='\git'

function chpwd {
  if [ -d "$HMCD_DIR" ]; then
    alias git="$HMCD"
  else
    alias git="$GIT"
  fi
}
chpwd
