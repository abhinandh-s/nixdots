#!/usr/bin/env sh

shuf -i 100-99999999 -n 1 > random.txt

update-nix
