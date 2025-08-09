{ pkgs, ... }:
let
  catppuccin = pkgs.catppuccin.mocha;
in
  {
  # Move the cava configuration under the `config` attribute
  config.programs.cava = {
    package = pkgs.cava;
    enable = true;
    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;

      # Use the selected color
      color = {
        background = "'${catppuccin.crust}'";
        foreground = "'${catppuccin.red}'";
      };
    };
  };
}

