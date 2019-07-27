# Env
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"
export GOPATH="$HOME/gocode"
export GOROOT="/usr/local/Cellar/go/1.12.4/libexec/"
export PATH="$PATH:/usr/bin:$GOPATH/bin:$HOME/.rvm/bin:$HOME/.cargo/bin:$HOME/Cloned/arcanist/bin"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export EDITOR="nvim"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export GPG_TTY=$(tty)
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
export BISON="/usr/local/opt/bison/bin/bison"

# Aliases
alias hmcd='/usr/bin/git --git-dir=$HOME/.hmcd/ --work-tree=$HOME'
alias alacritty='/Applications/Alacritty.app/Contents/MacOS/alacritty'
alias vim="nvim"
alias lldb="PATH=/usr/bin:$PATH lldb" # source MacOS python
alias python="python3"
alias pip="pip3"
alias xs="exa -lhga --git"

# Functions
V() { cd ~/Documents/Vanderbilt/$1 }
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
	/usr/local/bin/ranger "$@"
    else
        exit
    fi
}

# Plugins
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting alias-tips)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
autoload -U compinit; compinit

# Theme and Prompt
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_IGNORE_TERM_COLORS=true

autoload -U promptinit; promptinit
PURE_GIT_PULL=1
source "$HOME/.purepower"

# Load ZSH
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
