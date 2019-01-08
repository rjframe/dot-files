# Better commands.
alias mv='mv -v'

alias ls='ls -lph --color=auto'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# CentOS doesn't have tree.
if ! command -v tree; then
    alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
fi

if command -v notify-send; then
    # Add an "alert" alias for long running commands.
    # Ex: sleep 3; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

alias svim='sudo vim'
alias vi=vim
if ! command -v gvim; then
    alias gvim=vim
fi

alias play=ansible-playbook

# Recursively remove .DS_Store files (from macOS).
alias dsrm="find . -name '.DS_Store' -type f -ls -delete"
