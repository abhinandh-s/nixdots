{ config, pkgs, ... }:
{
  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    backend = "glx";
    fade = true;
    settings = {
      blur = { method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}
