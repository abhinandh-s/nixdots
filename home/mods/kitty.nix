{config, ...}:
# theme = Tomorrow Night, Twilight, Tokyo Night, Dracula
# font.name = "Maple Mono";
# font_family = "FiraCode Nerd Font Mono";
{
  programs.kitty = {
    enable = true;
    keybindings = {
      # tab
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "ctrl+p" = "paste_from_clipboard";
      "ctrl+c" = "copy_to_clipboard";
    };
    settings = {
      font_family = "Maple Mono";
      font_size = "13";
      window_padding_width = 20;
      exe_search_path = "+/etc/profiles/per-user/${config.home.username}/bin";
      shell = "fish";
      editor = "nvim";
      copy_on_select = "clipboard";
      confirm_os_window_close = 0;
      hide_window_decorations = "no";
      background_opacity = "1.0";
      background_blur = 50;
      notify_on_cmd_finish = "always"; # Only send a notification when the window does not have keyboard focus.
    };
    # themeFile = "Tokyo Night";
  };
}
