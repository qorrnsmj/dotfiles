PROMPT="%B%F{green}%n@%m %F{blue}%~ $%f%b"
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

bindkey -v
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^L' clear-screen
bindkey '^W' backward-kill-word
bindkey "^P" up-history
bindkey "^N" down-history

autoload -Uz compinit; compinit
autoload -Uz colors; colors
autoload -Uz history-search-end

zstyle ':completion:*:default' menu select=2           # Allow selection with Tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'    # Case insensitive completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  # Colorize file completion list

setopt HIST_IGNORE_DUPS      # Don't save consecutive duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS  # Remove all duplicate commands from history
setopt INC_APPEND_HISTORY    # Update the history file in real time
setopt SHARE_HISTORY         # Share history across terminals
setopt AUTO_PARAM_SLASH      # Add / to directory names for further completion
setopt AUTO_PARAM_KEYS       # Auto-complete parentheses and brackets
setopt MARK_DIRS             # Append / to directories during filename expansion
setopt AUTO_MENU             # Cycle through completion options with repeated tab presses
setopt CORRECT               # Correct spelling mistakes in commands
setopt INTERACTIVE_COMMENTS  # Allow comments with # in interactive shell
setopt MAGIC_EQUAL_SUBST     # Allow completion after = in arguments like --prefix=/usr
setopt COMPLETE_IN_WORD      # Complete at the cursor position within a word
setopt PRINT_EIGHT_BIT       # Display Japanese filenames correctly
setopt AUTO_CD               # Change to directory without typing cd
setopt NO_BEEP               # Disable beep sound

# -------------------------------------------------------------------
 
alias ..='cd ..'
alias l='clear && ll'
alias ls='ls -hFXC --color=auto --group-directories-first'
alias ll='ls -lhFX --color=auto --group-directories-first'
alias la='ls -lhFXA --color=auto --group-directories-first'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias psc='ps --sort=-pcpu'
alias pss='ps --sort=-size'
alias pst='ps --sort=-start_time'
alias fwc='sudo firewall-cmd'
alias bye='echo "Have a nice day." && exit'
alias sudo='sudo '
alias chess='cli-chess'

abbr -S sc='screen' > /dev/null 2>&1
abbr -S tm='tmux' > /dev/null 2>&1
abbr -S pm='podman' > /dev/null 2>&1
abbr -S pmc='podman-compose' > /dev/null 2>&1
abbr -S kc='kubectl' > /dev/null 2>&1
abbr -S mk='minikube' > /dev/null 2>&1
abbr -S hl='helm' > /dev/null 2>&1
abbr -S cl='cilium' > /dev/null 2>&1

# -------------------------------------------------------------------

# mkcd: mkdir && cd
function mkcd() {
    mkdir $1
    if [[ -d $1 ]]; then
        cd $1
    fi
}

# ^R: history with fzf
function fzf-history() {
    local selected_command
    selected_command=$(history -n 1 | fzf --tac --no-sort --exact --tiebreak=index --query "$LBUFFER")
    if [[ -n $selected_command ]]; then
        LBUFFER=$selected_command
    fi
}
zle -N fzf-history
bindkey '^R' fzf-history

# cdr (cd history) settings
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'      recent-dirs-max 500
  zstyle ':chpwd:*'      recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

# ^E: cdr with fzf
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf --exact`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
zle -N fzf-cdr
bindkey '^E' fzf-cdr

# ^Z: fg with ctrl+z
function fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ^F: fg with fzf
function fzf-fg() {
    wc=$(jobs | wc -l | tr -d ' ')
    if [ $wc -ne 0 ]; then
        job=$(jobs | awk -F "suspended" "{print $1 $2}"|sed -e "s/\-//g" -e "s/\+//g" -e "s/\[//g" -e "s/\]//g" | grep -v pwd | fzf --exact | awk "{print $1}")
        wc_grep=$(echo $job | grep -v grep | grep 'suspended')
        if [ "$wc_grep" != "" ]; then
            fg %$job
        fi
    fi
}
zle -N fzf-fg
bindkey '^F' fzf-fg

# -------------------------------------------------------------------

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# -------------------------------------------------------------------

zinit ice wait'!0'
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light olets/zsh-abbr

# Auto-Warpify
[[ "$-" == *i* ]] && printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh", "uname": "Linux" }}\x9c' 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
