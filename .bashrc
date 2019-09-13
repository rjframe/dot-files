# ~/.bashrc: executed by bash(1) for non-login shells.
# See /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples.

# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s cmdhist
shopt -s no_empty_cmd_completion

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files; see lesspipe(1).
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### BEGIN Prompt ###

# Set variable identifying the chroot you work in (used in the prompt below).
if [ -z "${lin_chroot:-}" ] && [ -r /etc/lin_chroot ]; then
    lin_chroot=$(cat /etc/lin_chroot)
fi

# Set a fancy prompt (non-color, unless we know we "want" color).
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429).
    # (Lack of such support is extremely rare, and such a case would tend to
    # support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    PS1='${lin_chroot:+($lin_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${lin_chroot:+($lin_chroot)}\u@\h:\w\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${lin_chroot:+($lin_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# While we're here...
if [ "$color_prompt" = yes ]; then
    # Colored GCC warnings and errors.
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
fi
unset color_prompt

### END Prompt ###

# Enable programmable completion features.
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

export EDITOR=vim
export MANPAGER='less -X'

# This loads DVM into a shell session.
#if [ -f $HOME/dvm/scripts/dvm ]; then
#	. $HOME/dvm/scripts/dvm
#fi


### BEGIN Functions ###

# Create a directory then enter it.
mcd() {
	mkdir "${1}" && cd "${1}"
}

# cd up the specified number of directories.
up() {
    i="${1}"
    while [[ "$i" -gt 0 ]]; do
        cd ..
        i=$(($i-1))
    done
}

# cd to the ancestral directory of the given name (non-greedily).
# Ex: if PWD is ~/src/myproject/source/myproject/mymodule, then "goto myproject"
#    will cd to ~/src/myproject/source/myproject.
#    "goto myproject" again will cd to ~/src/myproject.
cto() {
    if [[ "$(pwd)" =~ ${1}$ ]]; then
        cd ../
        cto "${1}"
    else
        P="$(pwd)"
        cd "${P%${1}*}/${1}"
    fi
}

# Search for packages when I'm certain I somewhat know the name.
showp() {
    if command -v apt-cache; then
        apt-cache search ^$1
    elif command -v yum; then
        yum list $1\*
    elif command -v dnf; then
        yum list $1\*
    elif command -v pacman; then
        pacman -Ss '^vim'
    fi
}

# From https://github.com/rkirti/bashrc/blob/24fed1997a93da96ab402f68ed0bda9412e0dd10/.shells/functions#L25
function extract() {
    if [ ! -f $1 ]; then
        echo "'$1' is not a valid file"
        return
    fi

    case $1 in
        *.tar.bz2)  tar xjf $1;;
        *.tar.gz)   tar xzf $1;;
        *.bz2)      bunzip2 $1;;
        *.rar)      rar x $1;;
        *.gz)       gunzip $1;;
        *.tar)      tar xf $1;;
        *.tbz2)     tar xjf $1;;
        *.tgz)      tar xzf $1;;
        *.zip)      unzip $1;;
        *.Z)        uncompress $1;;
        *)          echo "'$1' cannot be extracted via extract()";;
    esac
}

### END Functions ###

if [ -f $HOME/.asdf/asdf.sh ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

if command -v fortune 1>/dev/null;  then
	fortune -e
fi
