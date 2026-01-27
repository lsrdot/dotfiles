if status --is-interactive

    set -Ua fish_user_paths ~/.cargo/bin
    starship init fish | source

    
    


    set -U fish_cursor_default block      
    set -U fish_cursor_insert block        
    set -U fish_cursor_visual block       
    set -U fish_cursor_replace_one block  


    #TMUX auto-start
    if not set -q TMUX; and set -q HYPRLAND_INSTANCE_SIGNATURE
        set -l session_name "main" 

        if tmux has-session -t $session_name 2>/dev/null
            tmux new-window -t $session_name
            exec tmux attach-session -t $session_name
        else
            exec tmux new-session -s $session_name
        end
    end

    #set -gx LS_COLORS "rs=0:di=1;38;2;51;255;102:fi=0;38;2;46;230;92:ln=38;2;51;255;102:ex=1;38;2;51;255;102:pi=38;2;51;255;102:so=38;2;51;255;102:bd=38;2;51;255;102:cd=38;2;51;255;102:mi=38;2;51;255;102"
    set -e LS_COLORS
    set -Ue LS_COLORS

    # retro error term flash
    function post_command_flash --on-event fish_postexec
        if test $status -ne 0
            printf \a
        end
    end

    alias vi="nvim"
    alias map="telnet mapscii.me | sed -n 's/\x1b\[[0-9;]*m//gp'"
    alias wifi="sudo iw dev wlan0 scan"
    alias weather="curl wttr.in/Belo+Horizonte"
    alias ping="gping"
    alias fake="genact"
    alias scorp="/home/dot/.scripts/scorp.fish"
    alias ls='ls --color=auto'

    # env vars
    set -x EDITOR "code --wait"
    set -x VISUAL "code --wait"
    set -gx PATH $PATH ~/.local/share/JetBrains/Toolbox/scripts
    set -gx PNPM_HOME "/home/dot/.local/share/pnpm"
    set -gx QT_QPA_PLATFORMTHEME qt5ct

    fish_add_path /home/dot/.spicetify
    fish_add_path ~/.spicetify

    
    # function fish_greeting
    #     set -l logo \
    #     " " \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣶⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⡀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⡆⠀⢀⣴⣿⣿⣿⣿⠿⠟⠛⠛⠛⠻⠿⣿⣿⣿⣿⣦⡀⠀⢰⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⠟⠉⠀⣴⣿⣿⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣦⠀⠉⠻⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⡿⠋⠀⠀⠀⣼⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣧⠀⠀⠀⠙⢿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡿⠉⠀⠀⠀⠀⢰⣿⣿⣿⠁⠀⠀⠀⠀⣤⣾⣿⣿⣿⣷⣦⠀⠀⠀⠀⠈⣿⣿⣿⡆⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⡏⠀⠀⠀⠀⠀⠀⣼⣿⣿⡏⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠀⠀⢹⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢿⣿⣿⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⣿⣿⣿⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⢸⣿⣿⣷⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⣼⣿⣿⡏⠀⠀⠀⠀⠀⢀⣾⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⣄⠀⠀⠀⠀⢿⣿⣿⣇⠀⠀⠀⠀⠀⠉⠛⠛⠛⠉⠀⠀⠀⠀⠀⣸⣿⣿⣿⠁⠀⠀⠀⣠⣴⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⡀⠀⠘⢿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⡿⠃⠀⢀⣠⣾⣿⣿⠿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⡀⠈⠻⢿⣿⣿⣶⠀⠀⠻⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⣠⣤⣾⣿⣿⡿⠏⠁⠀⣴⣿⣿⣿⠟⠉⢀⣤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⢿⠇⠀⠀⠀⠉⠛⠛⠀⠀⠀⠈⠙⠿⣿⣿⣿⣷⠀⠀⠀⣾⣿⣿⣿⠿⠁⠀⠀⠀⠀⠙⠛⠋⠀⠀⠀⠸⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⠀⠀⠀⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀⠀⠀⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣵⣷⣄⠀⠀⠀⠀⠀⢀⣿⣿⣿⠀⠀⠀⣿⣿⣿⡄⠀⠀⠀⠀⠀⣠⣾⣷⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣷⣦⣄⣀⣤⣾⣿⡿⠋⠀⠀⠀⠘⣿⣿⣷⣤⣀⣠⣤⣾⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀" \
    #         "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⡟⠛⠁⠀⠀⠀⠀⠀⠀⠈⠘⠿⢿⣿⣿⠻⠏⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

        
    #     for line in $logo
    #         echo $line
    #         sleep 0.03 
    #     end
    #     set_color normal
    # end

    function fish_greeting
    set -l ff (fastfetch --pipe false)

    for line in $ff
        echo $line
        sleep 0.02
    end
    end

    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
end 