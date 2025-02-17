if [ -t 1 ]; then
    echo
    fortune
    echo
fi

export EDITOR=vi
export PAGER=less
export SYSTEMD_PAGER=less
export FZF_DEFAULT_OPTS='--color=fg+:11 --height 70% --reverse --select-1 --exit-0 --multi'

export JAVA_HOME=/usr/local/java/jdk-22.0.2
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/usr/share/bcc/tools
export PATH=$PATH:/home/qorrnsmj/.local/bin
