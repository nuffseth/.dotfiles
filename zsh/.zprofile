export XDG_CONFIG_HOME="$HOME/.config"
VIM="nvim"

PERSONAL=$XDG_CONFIG_HOME/personal
source $PERSONAL/env
for i in `find -L $PERSONAL`; do
    source $i
done

# Add Homebrew to PATH
eval $(/opt/homebrew/bin/brew shellenv)

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

bindkey -s ^f "tmux-sessionizer\n"
