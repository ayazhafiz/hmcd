# Handles master Zsh configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

# Source common custom configurations
ZSH_ETC="$HOME/.zsh_etc"

# Vi mode
set -o vi
bindkey -M viins 'jj' vi-cmd-mode
bindkey -v

# Env
export PATH="$HOME/.local/bin:/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# export PATH="$HOME/Code/Zig/source/zig-0.9.0-dev:$PATH"

source "$ZSH_ETC/go.zsh"
source "$ZSH_ETC/bison.zsh"
source "$ZSH_ETC/haskell.zsh"
source "$ZSH_ETC/llvm.zsh"
source "$ZSH_ETC/python.zsh"
source "$ZSH_ETC/rust.zsh"
source "$ZSH_ETC/yarn.zsh"

source "$ZSH_ETC/codes.zsh"
source "$ZSH_ETC/hmcd.zsh"
source "$ZSH_ETC/projects.zsh"
source "$ZSH_ETC/school.zsh"
source "$ZSH_ETC/scripts.zsh"

source "$ZSH_ETC/secrets.zsh"

source "$ZSH_ETC/plugins.zsh"
source "$ZSH_ETC/theme.zsh"

source "$ZSH_ETC/gpg.zsh"
source "$ZSH_ETC/openssl.zsh"
source "$ZSH_ETC/nvim.zsh"

# Load ZSH via oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# Scripts that must happen last
source "$ZSH_ETC/fzf.zsh"
source "$ZSH_ETC/nvm.zsh"
source "$ZSH_ETC/ruby.zsh"

# opam configuration
test -r /Users/hafiz/.opam/opam-init/init.zsh && . /Users/hafiz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/hafiz/.ghcup/env" ] && source "/Users/hafiz/.ghcup/env" # ghcup-env
if [ -e /Users/hafiz/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/hafiz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export YVM_DIR=/Users/hafiz/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# Wasmer
export WASMER_DIR="/Users/hafiz/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
