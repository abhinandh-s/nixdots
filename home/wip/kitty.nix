{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Tomorrow Night";
    font.name = "Maple Mono";
    font.size = 17;
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
    extraConfig = ''

    '';
    environment = {
      "LS_COLORS" = "1";
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+f&gt;2" = "set_font_size 20";
    };
  };
}
