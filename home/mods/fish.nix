{ pkgs,... }:
{
  programs = {
    fzf.enableFishIntegration = true;
    eza.enableFishIntegration = true;
    yazi.enableFishIntegration = true;
    zoxide.enableFishIntegration = true;
    kitty.shellIntegration.enableFishIntegration = true;
    fish = {
      enable = true;
      package = pkgs.fish;
      loginShellInit = "";
      shellInit = "set -U fish_greeting";
      shellInitLast = "";
      shellAbbrs = {
        l = "less";
        gco = "git checkout";
        "-C" = {
          position = "anywhere";
          expansion = "--color";
        };
      };
      shellAliases = {
        redmi-r = "rsync -P -av -e 'ssh -p 5000'";
        redmi-s = "ssh abhi@192.168.1.100 -p 5000";
        ll = "ls -l";
        l = "eza -lA --git-ignore --hyperlink --total-size --time-style=relative --time=modified -o -s modified";
        gc = "git clone";
        update-nix = "sudo nixos-rebuild switch --flake .";
        getrust = "cp ~/projects/github/nix-shells/rust/* .";
        develop = "nix develop --command nu";
        "..." = "cd ../..";
      };
      plugins = [
        {
          name = "z";
          src = pkgs.fetchFromGitHub {
            owner = "jethrokuan";
            repo = "z";
            rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
            sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
          };
        }

        # oh-my-fish plugins are stored in their own repositories, which
        # makes them simple to import into home-manager.
        {
          name = "fasd";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "plugin-fasd";
            rev = "38a5b6b6011106092009549e52249c6d6f501fba";
            sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";
          };
        }
      ];
    };
  };
}
