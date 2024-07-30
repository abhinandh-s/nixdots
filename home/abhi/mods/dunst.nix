{ config, pkgs, theme, ... }:
{
services.dunst = {
  enable = true;
  package = pkgs.dunst;
  settings = {
  global = {
    width = 400;
    height = 800;
    offset = "10x40";
    origin = "top-right";
    padding = 8;
    transparency = 0;
    frame_width = 1;
    frame_color = "${theme.base07}";
    font = "Maple Mono 9";
    icon_corner_radius = 10;
    min_icon_size = 32;
    max_icon_size = 128;
    separator_height = 1;
    corner_radius = 10;
  };
  
  # play_sound = {
  #       summary = "*";
  #       script = "/home/abhi/.local/bin/alert";
  #     };

  urgency_normal = {
    background = "#1E2127";
    foreground = "#FFFFFF";
    timeout = 10;
  };
 };

};
}
