# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export EDITOR=/usr/bin/vi
export PAGER=less
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\]'

alias ..='cd ..'
alias ls='ls -hFXC --color=auto --group-directories-first'
alias ll='ls -lhFX --color=auto --group-directories-first'
alias la='ls -lhFXA --color=auto --group-directories-first'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias scs='screen -S'
alias scl='screen -ls'
alias scr='screen -r'
alias scd='screen -d'
alias ps='ps --sort=start_time'
alias bye='exit'
alias his='history'
alias jobs='jobs -l'
alias restore=/usr/local/local_dfs/bin/restore
#bind -x $'"\C-l":clear;'

sck() {
    screen -XS "$1" kill
}

set -o vi
