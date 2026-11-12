export XDG_CONFIG_HOME="$HOME/.config"
VIM="nvim"

GLOBALZSH=$XDG_CONFIG_HOME/global
source $GLOBALZSH/env
for i in `find -L $GLOBALZSH`; do
    source $i
done

# Add Homebrew to PATH
eval $(/opt/homebrew/bin/brew shellenv)
eval "$(zoxide init zsh)"

export FLUTTERPATH="$HOME/Development/flutter/bin"
export GIT_EDITOR=$VIM
export ASDF_DATA_DIR="$HOME/.asdf"

# ~/ Clean-up:
export XDG_DATA_HOME="$HOME/.local/share"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump-$HOST"
# export HISTFILE="$XDG_DATA_HOME/history"
export DOTFILES="$HOME/.dotfiles"

addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.asdf/shims

# Work
addToPath $HOME/.sledge/bin

bindkey -s ^f "tmux-sessionizer\n"

# export http_proxy="http://proxy.wal-mart.com:9080"
# export https_proxy="http://proxy.wal-mart.com:9080"
export no_proxy="localhost,127.0.0.1,postman.com,*.postman.com,.wal-mart.com,.walmart.net,.walmart.com"