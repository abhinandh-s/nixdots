{
pkgs,
colorpencil,
...
}:
{
  programs.yazi = {
    enable =true;
    enableNushellIntegration = true;
    package = pkgs.yazi;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        show_hidden = true;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
        show_symlink = true; # Show the path of the symlink file point to, after the filename.

      };
    };
    # keys 
    # f = filter
    # s = search
    # y = yank/copy
    # d = delete/trash
    # p = paste
    keymap = {
      manager.prepend_keymap = [
        # { run = "paste --follow"; on = [ "<space>" "p" ]; }
        { run = "quit"; on = [ "i" ]; desc = "quit"; }
        { run = "quit"; on = [ "q" ]; }
        { run = "escape"; on = [ "<esc>" ]; }
        { run = "backspace"; on = [ "<backspace>" ]; }
        { run = "cd ~/downloads"; on = [ "g" "d" ]; desc = "Cd to ~/downloads"; }
        { run = "cd ~/projects/github/nixdots"; on = [ "g" "n" ]; desc = "Cd to ~/projects/github/nixdots"; }
      ];
    };
    #   input.keymap = [
    #     { exec = "close"; on = [ "<c-q>" ]; }
    #     { run = "close --submit"; on = [ "<enter>" ]; }
    #     { exec = "escape"; on = [ "<esc>" ]; }
    #   ];
    theme = {
      filetype = {
        rules = [
          { fg = "${colorpencil.cat_sky}"; mime = "image/*"; }
          { fg = "${colorpencil.cat_green}"; mime = "video/*"; }
          { fg = "${colorpencil.cat_mauve}"; mime = "audio/*"; }
          { fg = "${colorpencil.cat_blue}"; mime = "application/x-bzip"; }
        ];
      };
    };
  };
}
