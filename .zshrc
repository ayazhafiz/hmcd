# Handles master Zsh configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

# Source common custom configurations
ZSH_ETC="$HOME/.zsh_etc"

source "$ZSH_ETC/go.zsh"
source "$ZSH_ETC/bison.zsh"
source "$ZSH_ETC/haskell.zsh"
source "$ZSH_ETC/llvm.zsh"
source "$ZSH_ETC/python.zsh"
source "$ZSH_ETC/rust.zsh"
source "$ZSH_ETC/yarn.zsh"

source "$ZSH_ETC/codes.zsh"
source "$ZSH_ETC/hmcd.zsh"
source "$ZSH_ETC/school.zsh"
source "$ZSH_ETC/scripts.zsh"

source "$ZSH_ETC/secrets.zsh"

source "$ZSH_ETC/plugins.zsh"
source "$ZSH_ETC/theme.zsh"

source "$ZSH_ETC/gpg.zsh"
source "$ZSH_ETC/openssl.zsh"
source "$ZSH_ETC/nvim.zsh"
source "$ZSH_ETC/nvm.zsh"

# Env
export PATH="$HOME/.local/bin:/usr/bin:$PATH"

# Load ZSH via oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# Scripts that must happen last
source "$ZSH_ETC/fzf.zsh"
source "$ZSH_ETC/ruby.zsh"
