
{ config, lib, pkgs, colorpencil, ... }:
let
  selectedColor = builtins.getAttr (config.my.colorpencil.option) colorpencil;
in
  {
  # Declare the custom option using a nested structure
  options.my.colorpencil.option = lib.mkOption {
    type = lib.types.str;
    default = "green";  # Default color is pink
    description = "Select the color for the cava visualization (red, green, pink, blue)";
  };

  # Move the cava configuration under the `config` attribute
  config.programs.cava = {
    package = pkgs.cava;
    enable = true;
    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;

      # Use the selected color
      color = {
        background = "'${selectedColor.background}'";
        # foreground = "'${selectedColor.foreground}'";
        foreground = "'${selectedColor.foreground}'";
      };
    };
  };
}

