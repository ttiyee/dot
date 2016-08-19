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
    alias mkdir='mkdir -p'
    alias mv='mv -iv'
    alias readme='pandoc -s -f markdown -t man README.md | groff -T utf8 -man | less'
    alias syn="rsync --progress -avz -e ssh "
    alias startxs='startx -- -dpi 64'
    alias startxl='startx -- -dpi 192'

    # Autocomplete
    [ -r /usr/share/bash-completion/bash_completion     ] && . /usr/share/bash-completion/bash_completion
    [ -r /etc/docker.autocomplete                       ] && . /etc/docker.autocomplete

    # Base16 Shell
    BASE16_SHELL="/opt/base16-shell/base16-google.dark.sh"
    [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

    # Default(s)
    alias default-file-browser='ranger'
    alias default-music-player='cmus'
    alias default-pdf-viewer='zathura'
    alias default-picture-viewer='gpicview'
    alias default-video-player='smplayer'

    # Enviromental(s)
    export EDITOR=vim
    export GTK_THEME=Numix
    export TERMINAL=mate-terminal
    export VISUAL=vim

    # Hostnickname
    export HOSTNICKNAME=$(hostname | cut -d'-' -f1)

    # Mark
    hash mark 2>/dev/null && [ ! -z "$(mark --latest)" ] && cd $(mark --latest)

    # PS1
    PS1b='\[\e[1;30m\]'
    PS1e='\[\e[m\]'
    PS1u='\[\e[1;36m\]'
    if [ $UID -eq 0 ]; then
        PS1u='\[\e[1;31m\]'
    fi
    PS1="\n$PS1b[$PS1e\t$PS1b][$PS1u\u$PS1b@$PS1e$HOSTNICKNAME$PS1b]$PS1u :: \[\e[m\]"

    # Path - Build
    for bin in `find /git/build -name bin | grep build`; do 
        export PATH="$PATH:$bin"
    done

    # Path - Common
    [ -d '/git/common/bin' ] && export PATH=$PATH:'/git/common/bin'

    # Start - X - tty1
    if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
        if [ $UID -ne 0 ]; then
            if [[ `hostname` == 'laptop-lenovo-yoga2pro' ]]; then
                startxl
            else
                startx
            fi
        fi
    fi

    # Window(s)
    if [ -d /mnt/c/Windows ] || [ $LC_WINDOWS10 ]; then
        export WINDOWS10=0
    fi
    if [ $WINDOWS10 ]; then
        export LC_WINDOWS10=$WINDOWS10
    fi

    # Umask
    umask 027

    # Update [ lines & columns ]
    shopt -s checkwinsize

    # X-tend
    [ -e "$HOME/.bashrcx" ] && source "$HOME/.bashrcx"




#
#
#
#