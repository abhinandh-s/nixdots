{ config }
:
{
  programs.zsh = {
    enable = true;
    initExtraFirst = "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7f849c'";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      gc = "git clone";
      develop = "nix develop --command 'zsh'";
      rdevelop = "cd ~/github/nixdots/custom/mods/shells/rust && nix develop --command 'zsh' && echo 'Environment ready!'";
      gitpush = "git add -A && git status && git commit -m '-' && git status && git push";
      update = "sudo nixos-rebuild switch --flake .";
      z = "eza -lA --git-ignore --hyperlink --total-size --time-style=relative --time=modified -o -s modified";
      getrust = "cp ~/projects/github/nix-shells/rust/* .";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
