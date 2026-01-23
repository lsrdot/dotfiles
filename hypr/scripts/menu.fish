#!/usr/bin/fish

# O Fish trata o $PATH como uma lista, então percorremos ela de forma limpa
ls $PATH | sort -u | fuzzel --dmenu \
    --anchor center \
    --y-margin 0 \
    --width 30 \
    --lines 1 \
    --horizontal-pad 10 \
    --vertical-pad 10 \
    --background-color 000900ff \
    --text-color 86ff55ff \
    --prompt-color 86ff55ff \
    --selection-color 86ff55ff \
    --selection-text-color 000300ff \
    --match-color ffffffff \
    --border-width 2 \
    --border-color 595959ff \
    --border-radius 5 \
    --font "JetBrainsMono Nerd Font:size=10" \
    --prompt "> " | read -l command

# Executa o comando apenas se algo foi selecionado
if test -n "$command"
    hyprctl dispatch exec -- $command
end
