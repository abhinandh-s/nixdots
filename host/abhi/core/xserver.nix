{ config, lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile.enable = true;
      dwm.enable = true;
    };
  };

  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ../../../custom/overlays/dwm;
  };


  services.displayManager.sddm = {
    enable = true; # Enable SDDM.
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        # Set your configuration options here.
        # Here is a simple example:
        # Background = ../../assets/vivid_rainwld.jpg;
        Background = lib.cleanSource ../../../assets/vivid_rainwld.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
        # ...
      };
    };
  };

}
