# working but it wont start automatically :(
{ config, pkgs, ... }:
{
  services.betterlockscreen = {
    enable = true;
    package = pkgs.betterlockscreen;
    inactiveInterval = 5;
    # arguments = [ "-u ~/Documents/ResizedImages/exit_rf_vivid_rainwld.jpg" ];
  };
}
