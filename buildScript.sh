#!/usr/bin/env bash

shuf -i 100-99999999 -n 1 > random.txt

sudo nixos-rebuild switch --flake .
