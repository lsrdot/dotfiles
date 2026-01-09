if status is-interactive

    set -g fish_greeting ""
    set -Ua fish_user_paths ~/.cargo/bin

    starship init fish | source

    set -gx QT_QPA_PLATFORMTHEME qt5ct

    set -gx LS_COLORS "di=38"

    alias top="btop"
    alias vi="nvim"
    alias sysup="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm && reboot"

    set -gx PATH $PATH ~/.local/share/JetBrains/Toolbox/scripts

    set -x EDITOR "code --wait"
    set -x VISUAL "code --wait"

    set -U fish_color_valid_path ''
    set -U fish_color_match normal
    set -U fish_color_completion normal
    set -U fish_color_selection normal
    set -U fish_pager_color_prefix normal
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description normal
    set -U fish_color_autosuggestion 555

end

fish_add_path /home/dot/.spicetify

set -gx PNPM_HOME "/home/dot/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
