{ pkgs, colorpencil, ... }:
{
  programs.cava = {
    package =     pkgs.cava;
    enable = true;
    settings = {
      general.framerate = 60;
      smoothing.noise_reduction = 88;
      color = {
        background =  "'${colorpencil.tknyt_base00}'";
        foreground = "'${colorpencil.cat_red}'";
      };
    };
  };
}
