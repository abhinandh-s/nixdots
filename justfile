test:
  @echo " "
  @echo "random number changed from"
  @echo " "
  @cat random.txt
  @echo " "
  @shuf -i 100-99999999 -n 1 > random.txt
  @echo "to"
  @echo " "
  @cat random.txt
  @echo " "
  @git add -A
  sudo nixos-rebuild test -v --flake .

build:
  shuf -i 100-99999999 -n 1 > random.txt
  git add -A
  sudo nixos-rebuild switch --flake .
  sudo nix-store --optimise

push:
  git gc
  git status
  git add -A
  git commit -m "Refactoring"
  git push

update-otter:
  sudo nix flake lock --update-input otter

update-roxide:
  sudo nix flake lock --update-input roxide
  shuf -i 100-99999999 -n 1 > random.txt
  git add -A
  sudo nixos-rebuild switch --flake .

update-lyricz:
  sudo nix flake lock --update-input lyricz

update-brightness:
  sudo nix flake lock --update-input brightness

update-firefox:
  sudo nix flake lock --update-input firefox

update-nixpkgs:
  sudo nix flake lock --update-input nixpkgs

update-nixpkgs-unstable:
  sudo nix flake lock --update-input nixpkgs-unstable

update-home-manager:
  sudo nix flake lock --update-input home-manager



