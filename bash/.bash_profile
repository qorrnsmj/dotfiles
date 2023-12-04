# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# fortune
if [ -t 1 ]; then
    echo
    fortune
    echo
fi

# User specific environment and startup programs
JAVA_HOME=/usr/local/java/jdk-17.0.9+9
PATH=$JAVA_HOME/bin:$PATH
export PATH

bind -x $'"\C-l":clear;'
