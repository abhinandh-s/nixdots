#!/usr/bin/env fish

picom &
conky --daemonize --pause=1 -c ~/.config/conky/system &
clipcatd &
maestral start &
