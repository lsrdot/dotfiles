if status --is-interactive
    
    
    set -g fish_greeting ""
    set -Ua fish_user_paths ~/.cargo/bin
    starship init fish | source

    if not set -q TMUX
        set -l session_name "main" 

        if tmux has-session -t $session_name 2>/dev/null
            tmux new-window -t $session_name
            exec tmux attach-session -t $session_name
        else
            exec tmux new-session -s $session_name
        end
    end

set -gx LS_COLORS "rs=0:di=1;38;2;134;255;85:fi=38;2;111;230;63:ln=38;2;111;230;63:ex=38;2;124;255;74:pi=38;2;111;230;63:so=38;2;111;230;63:bd=38;2;111;230;63:cd=38;2;111;230;63:mi=38;2;111;230;63"

    function post_command_flash --on-event fish_postexec
        if test $status -ne 0
            printf \a
        end
    end

    alias vi="nvim"
    alias s="yay -Ss"
    alias i="yay -Sy"
    alias u="yay -Syu"
    alias sysup="yay -Syu --noconfirm && reboot"
    alias remove="yay -Rns"
    alias py="python"
    alias map="telnet mapscii.me | sed -n 's/\x1b\[[0-9;]*m//gp'"
    alias wifi="sudo iw dev wlan0 scan"
    alias weather="curl wttr.in/Belo+Horizonte"
    alias ping="gping"
    alias fake="genact"
    

    set -x EDITOR "code --wait"
    set -x VISUAL "code --wait"
    set -gx PATH $PATH ~/.local/share/JetBrains/Toolbox/scripts
    set -gx PNPM_HOME "/home/dot/.local/share/pnpm"
    set -gx QT_QPA_PLATFORMTHEME qt5ct

    fish_add_path /home/dot/.spicetify
    fish_add_path ~/.spicetify

    function fish_greeting
    set -l logo \
        " "\
        "                  ▄" \
        "                 ▄█▄" \
        "                ▄███▄" \
        "               ▄█████▄" \
        "              ▄███████▄" \
        "             ▄ ▀▀██████▄" \
        "            ▄██▄▄ ▀█████▄" \
        "           ▄█████████████▄" \
        "          ▄███████████████▄" \
        "         ▄█████████████████▄" \
        "        ▄███████████████████▄" \
        "       ▄█████████▀▀▀▀████████▄" \
        "      ▄████████▀      ▀███████▄" \
        "     ▄█████████        ████▀▀██▄" \
        "    ▄██████████        █████▄▄▄" \
        "   ▄██████████▀        ▀█████████▄" \
        "  ▄██████▀▀▀              ▀▀██████▄" \
        " ▄███▀▀                       ▀▀███▄" \
        "▄▀▀                               ▀▀▄"

    set_color 33ff33 

    for line in $logo
        echo $line
        sleep 0.03 
    end

    set_color normal
    echo "" 
    end



    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
end