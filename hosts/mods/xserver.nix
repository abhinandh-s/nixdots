{
  lib,
  pkgs,
  ...
}: {
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
      rev = "0031712dcf6dd51de6d347bdf7f7c6b57bdeb6e3";
      sha256 = "sha256-R5r8CwE33XsxwJflEd2KKea4RyYC0ob9cyGyx6VO78E=";
    };
    # conf = builtins.readFile ../../custom/configs/dwm/config.h;
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
