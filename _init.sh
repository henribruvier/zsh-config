#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

if [[ "x$SYSTEM" = "xDarwin" ]]; then
    # system executables
    #export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
    # local system binaries
    export PATH=/usr/local/sbin:/usr/local/bin:$PATH
    export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$PATH
fi

# Non-default homebrew install
export PATH=$PATH:$HOME/usr/local/bin

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# bootstrap the zinit script
#
#source "$HOME/.zinit/bin/zi.zsh"

# and load the plugins
source "$HOME/.zsh-config/zinit.zsh"
#-----------------------------------------------------

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship.toml

#-----------------------------------------------------
# Setting autoloaded functions
#
my_zsh_fpath=${ZSHCONFIG}/autoloaded

fpath=($my_zsh_fpath $fpath)

if [[ -d "$my_zsh_fpath" ]]; then
    for func in $my_zsh_fpath/*; do
        autoload -Uz ${func:t}
    done
fi
unset my_zsh_fpath

#-----------------------------------------------------
#
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$my_zsh_lib" ]]; then
    for file in $my_zsh_lib/*.zsh; do
        source $file
    done
fi
unset my_zsh_lib

#-----------------------------------------------------
# Development stuffs
#
dev_config_init=${SCRIPTS}/dev-config/_init.sh

[[ -f "$dev_config_init" ]] && source "$dev_config_init"

unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH
