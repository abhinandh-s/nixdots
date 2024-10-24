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
  sudo nixos-rebuild test -v --flake .

build:
  shuf -i 100-99999999 -n 1 > random.txt
  sudo nixos-rebuild switch --flake .

push:
  git gc
  git status
  git add -A
  git commit -m "Refactoring"
  git push
