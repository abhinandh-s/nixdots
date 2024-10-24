{ lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile = {
        enable = true;
        backend = "wayland";
      };
      dwm.enable = true;
    };
  };
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    # src = ../../custom/overlays/dwm;
    src = pkgs.fetchFromSourcehut {
      owner = "~abhinandh";
      repo = "dwm";
      rev = "951774d4495f8cccbf19b806f04941a18f217ef4";
      sha256 = "sha256-hVlzNkAS6PjbCZVhO6D1u7a8XA8YhFIrYTRMlPWjyXA=";
    };
    # configFile = pkgs.writeText "config.def.h" (builtins.readFile ../../custom/configs/dwm/config.h);
  };


  services.displayManager.sddm = {
    enable = true;
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        Background = lib.cleanSource ../../assets/wallpaper/wall-sddm.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
