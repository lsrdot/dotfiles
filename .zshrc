# =========================================================
#                     ZSH CONFIG 
# =========================================================


# ---------------------------------------------------------
# TRUECOLOR & ENV
# ---------------------------------------------------------
export COLORTERM="truecolor"
export EDITOR="nvim"
export VISUAL="nvim"
export PNPM_HOME="$HOME/.local/share/pnpm"
export QT_QPA_PLATFORMTHEME="qt5ct"
export PATH="$PNPM_HOME:$HOME/.local/share/JetBrains/Toolbox/scripts:$HOME/.spicetify:$HOME/.local/bin:$PATH"


# ---------------------------------------------------------
# OPTIONS
# ---------------------------------------------------------
setopt extendedglob
setopt globdots
setopt GLOB_COMPLETE
setopt MENU_COMPLETE
setopt LIST_TYPES


# ---------------------------------------------------------
# COMPLETIONS
# ---------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'm:{A-Z}={a-z}'


# ---------------------------------------------------------
# KITTY / GHOSTTY SHELL INTEGRATION
# ---------------------------------------------------------
if [[ -n "$KITTY_WINDOW_ID" && -f /usr/lib/kitty/shell-integration/zsh/kitty.zsh ]]; then
  source /usr/lib/kitty/shell-integration/zsh/kitty.zsh
fi


# ---------------------------------------------------------
# PLUGINS
# ---------------------------------------------------------
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=a485dd' # also color completion opt
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete)


# ---------------------------------------------------------
# SYNTAX HIGHLIGHTING & COLORS
# ---------------------------------------------------------
typeset -gA ZSH_HIGHLIGHT_STYLES
unset LS_COLORS
export LS_COLORS="di=0;38;2;240;246;252:fi=3;38;2;177;186;196:ln=00;36:ex=00;32:pi=00;33:so=00;35:bd=00;34;46:cd=00;34;43"
ZSH_HIGHLIGHT_STYLES[command]='fg=#f0f6fc'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#f0f6fc'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#f0f6fc'
ZSH_HIGHLIGHT_STYLES[function]='fg=#f0f6fc'

ZSH_HIGHLIGHT_STYLES[default]='fg=#ff7b72'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#ff7b72'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ff7b72'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#ff7b72'
ZSH_HIGHLIGHT_STYLES[string]='fg=#ff7b72'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#343434'



# ---------------------------------------------------------
# GIT & BELL HOOKS
# ---------------------------------------------------------
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

LAST_HIST_ID=$HISTCMD

function _run_precmd_hooks() {
    local last_status=$?
    vcs_info
    
    # Error bell (red flash)
    if [[ $last_status -ne 0 && $HISTCMD -ne $LAST_HIST_ID ]]; then
        printf "\e]11;#f85149\a"
        (sleep 0.05)
        printf "\e]11;#1B1B1B\a"
    fi
    LAST_HIST_ID=$HISTCMD
}
add-zsh-hook precmd _run_precmd_hooks

# ---------------------------------------------------------
# HISTORY
# ---------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# ---------------------------------------------------------
# ALIASES
# ---------------------------------------------------------
alias vi="nvim"
alias isgit="git rev-parse --is-inside-work-tree"
alias ls="ls --color=auto"
alias map="mapscii"
alias wifi="sudo iw dev wlan0 scan"
alias weather="curl v2.wttr.in/Belo+Horizonte"
alias ping="gping"
alias fake="genact"
alias cwifi="nmtui-connect"
alias stonks="tickrs -p -s NVDA,AAPL,MSFT,AMZN,GOOGL,GOOG,META,AVGO,TSLA,ASML,MU,COST,AMD,PLTR,NFLX,CSCO,LRCX,AZN,AMAT,INTC,KLAC,LIN,TMUS,PEP,TXN,APP,SHOP,AMGN,ISRG,GILD,BKNG,QCOM,ADI,PDD,HON,INTU,PANW,VRTX,ADBE,ARM,MELI,CRWD,SBUX,CMCSA,CEG,ADP,SNPS,DASH,MAR,ORLY,CDNS,ABNB,REGN,MNST,CTAS,MDLZ,CSX,WBD,MRVL,PCAR,AEP,ROST,FTNT,NXPI,BKR,IDXX,ADSK,EA,TRI,CPRT,KDP,CTSH,XEL,KHC,DXCM,GEHC,TEAM,BIIB,WDC,ANSS,MCHP,FAST,MSTR,VRSK,ROP,EBAY,EXC,LULU,ODFL,PAYX,ROKU,TTWO,WDAY,ZS,MDB,OKTA,DDOG,TSM,STNE,NU"
alias cstonks="tickrs -p -s BTC-USD,ETH-USD,USDT-USD,BNB-USD,XRP-USD,SOL-USD,USDC-USD,STETH-USD,TRX-USD,DOGE-USD,ADA-USD,WSTETH-USD,BCH-USD,WBTC-USD,WBETH-USD,WEETH-USD,USDS-USD,BSC-USD,XMR-USD,LINK-USD,LEO-USD,HYPE-USD,CBBTC-USD,WETH-USD,XLM-USD,USDE-USD,ZEC-USD,SUI-USD,LTC-USD,AVAX-USD"
alias r="run"
alias py="python3"

# ---------------------------------------------------------
# KEYBINDINGS
# ---------------------------------------------------------
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


# ---------------------------------------------------------
# CURSOR SHAPE — BLINKING BLOCK
# ---------------------------------------------------------
function _fix_cursor() {
  printf '\e[1 q'
}
add-zsh-hook precmd _fix_cursor

function zle-keymap-select {
  printf '\e[1 q'
}
zle -N zle-keymap-select
printf '\e[1 q'


# ---------------------------------------------------------
# FASTFETCH GREETING
# ---------------------------------------------------------
# function precmd_first_time {
#   fastfetch --pipe false | while IFS= read -r line; do
#     printf '%s\n' "$line"
#     sleep 0.016
#   done
#   precmd_functions=(${precmd_functions#precmd_first_time})
# }
# precmd_functions+=(precmd_first_time)

function precmd_first_time {
  local flag

  if [[ -n "$TMUX" ]]; then
    # Make a safe filename from $TMUX
    local safe_tmux=${TMUX//\//_}
    flag="/tmp/fastfetch_printed_${safe_tmux}"

    if [[ -f "$flag" ]]; then
      precmd_functions=(${precmd_functions:#precmd_first_time})
      return
    fi
  fi

  fastfetch --pipe false | while IFS= read -r line; do
    printf '%s\n' "$line"
    sleep 0.016
  done

  [[ -n "$flag" ]] && touch "$flag"

  precmd_functions=(${precmd_functions:#precmd_first_time})
}

precmd_functions+=(precmd_first_time)


# ---------------------------------------------------------
# EVALS
# ---------------------------------------------------------
eval "$(starship init zsh)"
eval $(thefuck --alias)


# ---------------------------------------------------------
# FZF
# ---------------------------------------------------------
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="
--ansi
--layout=reverse
--info=inline-right
--border=none
--highlight-line
--color=bg:#11121d,fg:#a0a8cd
--color=bg+:#212234,fg+:#a0a8cd
--color=hl:#ee6d85,hl+:#95c561
--color=prompt:#95c561
--color=pointer:#7199ee
--color=marker:#95c561
--color=spinner:#a485dd
--color=header:#38a89d
--color=info:#d7a65f
--color=separator:#212234
--color=gutter:#11121d
--color=scrollbar:#a485dd
"


# ---------------------------------------------------------
# FZF VI OPENER 
# ---------------------------------------------------------
invi() {
  local files
  files=("${(@f)$(fzf -m --preview 'bat --color=always {}')}") || return
  nvim "${files[@]}"
}


# ---------------------------------------------------------
# TRYING TO TINKER WITH TERMINAL OUTPUT FORMAT
# ---------------------------------------------------------
# function force_margin_reset() {
#   printf "\r"
# }
# add-zsh-hook preexec force_margin_reset


# trying to fix ffmpeg
export LIBVA_DRIVER_NAME=noop
