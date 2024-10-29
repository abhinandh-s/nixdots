{
config,
pkgs,
...
}:
let
  rebuildcommand = "cd ~/nixdots && git add * && git status && git commit -m 'refactoring' && git status && sudo nixos-rebuild switch --flake .";
  my_aliases = {
    ll = "ls -A";
    ".." = "cd ..";
    "..." = "cd ../..";
    "gc" = "git clone";
    "ga" = "git add";
    "rustshell" = "nix-shell ~/nixdots/custom/shells/rust/shell.nix";
    "rebuildmynix" = "cd ~/nixdots && git add * && git status && git commit -m 'refactoring' && git status && git push && sudo nixos-rebuild switch --flake .";
  };

in
  {
  programs.bash = {
    enable = false;
    bashrcExtra = ''
export EDITOR="nvim"
    '';
    shellAliases = {
    ll = "ls -A";
    ".." = "cd ..";
    "..." = "cd ../..";
    "gc" = "git clone";
    "ga" = "git add";
    "rustshell" = "nix-shell ~/nixdots/custom/shells/rust/shell.nix";
    "rebuildmynix" = "cd ~/nixdots && git add * && git status && git commit -m 'refactoring' && git status && git push && sudo nixos-rebuild switch --flake .";
  };
  };
}
