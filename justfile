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

otter-t:
  cp flake.nix.test flake.nix 
  shuf -i 100-99999999 -n 1 > random.txt
  git add -A
  sudo nixos-rebuild switch --flake .

otter-r:
  cp flake.nix.bak flake.nix 
  shuf -i 100-99999999 -n 1 > random.txt
  git add -A
  sudo nixos-rebuild switch --flake .


push:
  git gc
  git status
  git add -A
  git commit -m "Refactoring"
  git push
