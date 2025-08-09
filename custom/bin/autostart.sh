#!/usr/bin/env bash

picom &
conky --daemonize --pause=1 -c ~/.config/conky/system &
clipcatd &
maestral start &
