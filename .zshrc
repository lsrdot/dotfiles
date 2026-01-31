# =========================================================
# ZSH CONFIG — FIXED
# =========================================================

# ---------------------------------------------------------
# TRUECOLOR
# ---------------------------------------------------------
export COLORTERM="truecolor"

# ---------------------------------------------------------
# OPTIONS (ZSH-VALID ONLY)
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
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---------------------------------------------------------
# SYNTAX HIGHLIGHTING
# ---------------------------------------------------------
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='bold,fg=4'
ZSH_HIGHLIGHT_STYLES[builtin]='bold,fg=4'
ZSH_HIGHLIGHT_STYLES[function]='bold,fg=4'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=6'
ZSH_HIGHLIGHT_STYLES[arg]='fg=12'
ZSH_HIGHLIGHT_STYLES[error]='bold,fg=1'

# ---------------------------------------------------------
# LS_COLORS
# ---------------------------------------------------------
unset LS_COLORS
export LS_COLORS="di=1;34:ln=36:ex=32:fi=0:pi=33:so=35:bd=34;46:cd=34;43"

# ---------------------------------------------------------
# GIT
# ---------------------------------------------------------
autoload -Uz vcs_info
precmd() { vcs_info }

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
alias stonks="tickrs -p -s NVDA,AAPL,MSFT,AMZN,GOOGL,GOOG,META,AVGO,TSLA,ASML,MU,COST,AMD,PLTR,NFLX,CSCO,LRCX,AZN,AMAT,INTC,KLAC,LIN,TMUS,PEP,TXN,APP,SHOP,AMGN,ISRG,GILD,BKNG,QCOM,ADI,PDD,HON,INTU,PANW,VRTX,ADBE,ARM,MELI,CRWD,SBUX,CMCSA,CEG,ADP,SNPS,DASH,MAR,ORLY,CDNS,ABNB,REGN,MNST,CTAS,MDLZ,CSX,WBD,MRVL,PCAR,AEP,ROST,FTNT,NXPI,BKR,IDXX,ADSK,EA,TRI,CPRT,KDP,CTSH,XEL,KHC,DXCM,GEHC,TEAM,BIIB,WDC,ANSS,MCHP,FAST,MSTR,VRSK,ROP,EBAY,EXC,LULU,ODFL,PAYX,ROKU,TTWO,WDAY,ZS,MDB,OKTA,DDOG,TSM,STNE,NU"
alias cstonks="tickrs -p -s BTC-USD,ETH-USD,USDT-USD,BNB-USD,XRP-USD,SOL-USD,USDC-USD,STETH-USD,TRX-USD,DOGE-USD,ADA-USD,WSTETH-USD,BCH-USD,WBTC-USD,WBETH-USD,WEETH-USD,USDS-USD,BSC-USD,XMR-USD,LINK-USD,LEO-USD,HYPE-USD,CBBTC-USD,WETH-USD,XLM-USD,USDE-USD,ZEC-USD,SUI-USD,LTC-USD,AVAX-USD"
alias cwifi="nmtui-connect"

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
function zle-keymap-select {
  echo -ne '\e[1 q'
}
zle -N zle-keymap-select
echo -ne '\e[1 q'

# ---------------------------------------------------------
# EVALS ---------------------------------------------------------
eval "$(starship init zsh)"
eval $(thefuck --alias)

# ---------------------------------------------------------
# ENV
# ---------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
export PNPM_HOME="$HOME/.local/share/pnpm"
export QT_QPA_PLATFORMTHEME="qt5ct"

export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------
# FASTFETCH GREETING
# ---------------------------------------------------------
function precmd_first_time {
  fastfetch --pipe false | while IFS= read -r line; do
    echo "$line"
    sleep 0.015
  done
  precmd_functions=(${precmd_functions#precmd_first_time})
}
precmd_functions+=(precmd_first_time)

# ---------------------------------------------------------
# FZF
# ---------------------------------------------------------
source <(fzf --zsh)

# ---------------------------------------------------------
# FUZZY VI OPENER
# ---------------------------------------------------------
invi() {
  local files
  files=("${(@f)$(fzf -m --preview 'bat --color=always {}')}") || return
  nvim "${files[@]}"
}


