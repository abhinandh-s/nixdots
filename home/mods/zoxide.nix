{ pkgs, ... }
:
{
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableNushellIntegration = true;
    options = [
      # "--no-aliases"
    ];
  };
}
