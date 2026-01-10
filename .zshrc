
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'
setopt LIST_TYPES


export LS_COLORS="$(vivid generate snazzy)"


zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"





autoload -Uz vcs_info
precmd() { vcs_info }


zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f '
zstyle ':vcs_info:*' enable git



setopt PROMPT_SUBST
PROMPT='%F{grey}%n@%m%f:%F{cyan}%~%f$ '
#PROMPT='%F{grey}%n@%m%f:%F{cyan}%~%f$ ${vcs_info_msg_0_}'



HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history


alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
alias top="btop"
alias vi="nvim"
alias sysup="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm && reboot"
alias isgit="git rev-parse --is-inside-work-tree"


ZSH_HIGHLIGHT_STYLES[command]='fg=grey'
ZSH_HIGHLIGHT_STYLES[alias]='fg=grey'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=grey'
ZSH_HIGHLIGHT_STYLES[function]='fg=grey'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'





bindkey -e


bindkey '^[[1;5D' backward-word

bindkey '^[[1;5C' forward-word


bindkey '^H' backward-kill-word

bindkey '^[[3;5~' kill-word


bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line


typeset -g -A key


key[Delete]="${terminfo[kdch1]:-^[[3~]}"


bindkey "${key[Delete]}" delete-char



export EDITOR="code --wait"
export VISUAL="code --wait"



export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
