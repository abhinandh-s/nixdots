{ pkgs, ... }:{
  services.betterlockscreen = {
    enable = true;
    package = pkgs.betterlockscreen;
    arguments = [];
    inactiveInterval = 5;
  };
}
