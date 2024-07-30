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
  programs.zsh = {
    enable = false;
    shellAliases = my_aliases;
    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "enhancd";
        file = "init.sh";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "v2.2.1";
          sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
        };
      }
    ];
  };
  programs.bash = {
    enable = true;
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
