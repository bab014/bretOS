[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ] && . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" || . $HOME/.xprofile

qtile start
