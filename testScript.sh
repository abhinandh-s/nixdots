#!/usr/bin/env bash

# shuf is a program that comes with gnu coreutils, and it can generate random numbers.
# Nix will read that random number from random.txt, make it available in flake.nix and pass it as homemanager.BackupExtention value (as "String").
# So, no more homemanager complains about backup extention while testing

shuf -i 100-99999999 -n 1 > random.txt

# build and switches to new config but does not add it to boot menu 

sudo nixos-rebuild test -v --flake .
