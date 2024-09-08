{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (slstatus.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz xorg.libXft xorg.libXinerama xorg.libX11 ];
      src = ../../../custom/patches/slstatus;
      patches = [
      ];
      configFile = writeText "config.def.h" (builtins.readFile ../../../custom/patches/slstatus/config.h);
    }))
  ];
}
