setopt APPEND_HISTORY
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt NO_CASE_GLOB

# block cursor
echo -en "\e[=2c"

# Vi mode
#bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=2000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

if [ -f $HOME/.config/shells/common_rc ]; then
    . $HOME/.config/shells/common_rc
fi

if [[ ! -d ~/.zplug ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh

# WSL seems to have permissions issues...
if grep -q Microsoft /proc/version; then
    # TODO: Error if compaudit has no problems; need to check retcode/output.
    compaudit | xargs -r chmod g-o
fi

zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug "martinrotter/powerless", from:github, as:theme
source ~/.zplug/repos/martinrotter/powerless/powerless.zsh false
#source ~/.zplug/repos/martinrotter/powerless/utilities.zsh enable

#### Unexamined Ubuntu default config below:


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rjframe/.zshrc'

#### End default config.

zstyle ':completion:*' rehash true

zplug "zsh-users/zsh-syntax-highlighting", defer:2
source ~/.zplug/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
