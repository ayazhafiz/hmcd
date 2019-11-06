# Handles Rust environment configuration.
# This file is governed under no license.
#
# Author: @ayazhafiz
# Source: https://github.com/ayazhafiz/hmcd

export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

alias alacritty='/Applications/Alacritty.app/Contents/MacOS/alacritty'
alias xs="exa -lhga --git"
