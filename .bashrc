#!/bin/bash
#
#
#
#


    # Interactive
    [ -z "$PS1" ] && return


    # Alias(s)
    alias clipboard="xclip -i -selection clipboard"
    alias cp='cp -v'
    alias ll='ls -vlhF --color'
    alias ls='ls -vF --color'
    alias less='less -R'
    alias mark-lcd='echo = $(mark --latest) && cd $(mark --latest)'
    alias mkdir='mkdir -p'
    alias mv='mv -iv'
    alias readme='pandoc -s -f markdown -t man README.md | groff -T utf8 -man | less'
    alias startxl='startx -- -dpi 125'
    alias startxs='startx -- -dpi 75'
    alias syn="rsync --progress -avz -e ssh "

    # Autocomplete
    [ -r /etc/bash_completion.d/pass.bash-completion    ] && . /etc/bash_completion.d/pass.bash-completion
    [ -r /etc/docker.autocomplete                       ] && . /etc/docker.autocomplete
    [ -r /usr/share/bash-completion/bash_completion     ] && . /usr/share/bash-completion/bash_completion

    # Base16 Shell
    BASE16_SHELL="/opt/base16-shell/scripts/base16-nord.sh"
    [[ -s $BASE16_SHELL ]] && bash $BASE16_SHELL

    # Enviromental(s)
    export EDITOR=vim
    export GTK_THEME=Numix
    export SAL_USE_VCLPLUGIN=gtk
    export TERMINAL=gnome-terminal
    export VISUAL=vim

    # History - Format
    export HISTTIMEFORMAT="%d/%m/%y %T  "

    # Hostnickname
    export HOSTNICKNAME=$(cat '/etc/hostname' | cut -d'-' -f1)

    # Path(s)
    for path in $( find /git/develop -name bin 2> /dev/null ); do
        export PATH="$PATH:$path"
    done

    # Path(s) - Mark
    if hash mark 2>/dev/null; then cd "$( mark --latest )"; fi

    # PS1
    PS1b='\[\e[1;97m\]'
    PS1e='\[\e[1;0m\]'
    PS1u='\[\e[1;93m\]'
    PS1r='\[\e[1;0m\]'
    if [ $UID -eq 0 ]; then
        PS1u='\[\e[1;31m\]'
    fi
    PS1="$PS1b[$PS1u\u$PS1b@$PS1e$HOSTNICKNAME$PS1b] $PS1e\W$PS1b $PS1u::$PS1r "

    # Umask
    umask 0022

    # Update [ lines & columns ]
    shopt -s checkwinsize


    # X-tend / Override
    [ -e "$HOME/.bashrcx" ] && source "$HOME/.bashrcx"


#
#
#
#
