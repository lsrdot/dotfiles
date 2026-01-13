if status is-interactive
    set -g fish_greeting ""
    set -Ua fish_user_paths ~/.cargo/bin

    starship init fish | source

    set -gx QT_QPA_PLATFORMTHEME qt5ct

    set -gx LS_COLORS "\
di=01;38;2;255;255;255:\
fi=38;2;180;180;180:\
ln=38;2;220;220;220:\
ex=01;38;2;240;240;240:\
*.txt=38;2;160;160;160:\
*.md=38;2;200;200;200:\
*.json=38;2;190;190;190:\
*.yaml=38;2;190;190;190:\
*.yml=38;2;190;190;190:\
pi=38;2;150;150;150:\
so=38;2;170;170;170:\
bd=38;2;140;140;140:\
cd=38;2;140;140;140:\
or=38;2;120;120;120:\
mi=38;2;120;120;120:\
*.tar=38;2;130;130;130:\
*.zip=38;2;130;130;130:\
*.gz=38;2;130;130;130"

    set -g fish_color_normal white
    set -g fish_color_command white --bold
    set -g fish_color_param brwhite
    set -g fish_color_error white --bold
    set -g fish_color_comment 555555
    set -g fish_color_quote brwhite
    set -g fish_color_redirection white
    set -g fish_color_end white
    set -g fish_color_operator brwhite

    alias top="btop"
    alias vi="nvim"
    alias sysup="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm && reboot"

    set -x EDITOR "code --wait"
    set -x VISUAL "code --wait"

    set -gx PATH $PATH ~/.local/share/JetBrains/Toolbox/scripts
    set -gx PNPM_HOME "/home/dot/.local/share/pnpm"

    fish_add_path /home/dot/.spicetify
    fish_add_path ~/.spicetify

    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
end

