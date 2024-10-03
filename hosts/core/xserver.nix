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
      rev = "f813484c024af2748dece562a02b01f26e4671a2";
      sha256 = "sha256-3unfimPsBOSG+zhzvQlNstqJgAyTop9b6XMA4h4M03c=";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        Background = lib.cleanSource ../../assets/wallpaper/wall-sddm.png;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
