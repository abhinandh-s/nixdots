{ pkgs, ... }:
let
  catppuccin = pkgs.catppuccin.mocha;
in
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
        frame_color = "${catppuccin.text}";
        font = "Maple Mono 9";
        icon_corner_radius = 10;
        min_icon_size = 32;
        max_icon_size = 128;
        separator_height = 1;
        corner_radius = 10;
      };
      urgency_normal = {
        background = "${catppuccin.crust}";
        foreground = "${catppuccin.text}";
        timeout = 7;
      };
    };
  };
}
