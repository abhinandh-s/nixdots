{
  config,
  pkgs,
  colorpencil,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 16;
          y = 16;
        };
        dimensions = {
          columns = 80;
          lines = 24;
        };
        dynamic_padding = true;
        decorations = "None";
      };
      font = {
        size = 12;
        normal = {
          family = "Maple Mono";
          style = "Regular";
        };
        bold = {
          family = "Maple Mono";
          style = "Bold";
        };
        italic = {
          family = "Maple Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "Maple Mono";
          style = "Bold Italic";
        };
        offset = {
          x = 0;
          y = 1;
        };
        glyph_offset = {
          x = 0;
          y = config.programs.alacritty.settings.font.offset.y / 2;
        };
        builtin_box_drawing = true;
      };
      keyboard.bindings = [
        {
          key = "K";
          mods = "Alt|Shift";
          action = "ScrollLineUp";
        }
        {
          key = "J";
          mods = "Alt|Shift";
          action = "ScrollLineDown";
        }
        {
          key = "k";
          mods = "Alt|Control";
          action = "IncreaseFontSize";
        }
        {
          key = "j";
          mods = "Alt|Control";
          action = "DecreaseFontSize";
        }
        {
          key = "V";
          mods = "Alt";
          action = "Paste";
        }
         {
          key = "C";
          mods = "Control";
          action = "Copy";
        }
      ];
      cursor = {
        style = {
          shape = "Underline";
          blinking = "Off";
        };
        blink_interval = 250;
      };
      scrolling = {
        history = 5000;
        multiplier = 3;
      };
      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>";
        save_to_clipboard = true;
      };
      # shell = {
      #   program = "${pkgs.zsh}/bin/zsh";
      #};
      colors = {
        primary = {
          background = "${colorpencil.cat_crust}";
          foreground = "${colorpencil.cat_text}";
        };
        cursor = {
          text = "${colorpencil.base0A}";
          cursor = "${colorpencil.base01}";
        };
        selection = {
          text = "${colorpencil.cat_crust}";
          background = "${colorpencil.cat_subtext1}";
        };
        normal = {
          black = "${colorpencil.cat_base}";
          red = "${colorpencil.tknyt_base03}";
          green = "${colorpencil.cat_green}";
          yellow = "${colorpencil.cat_yellow}";
          blue = "${colorpencil.cat_blue}";
          magenta = "${colorpencil.base07}";
          cyan = "${colorpencil.cat_sky}";
          white = "${colorpencil.base09}";
        };
        bright = {
          black = "${colorpencil.cat_base}";
          red = "${colorpencil.cat_red}";
          green = "${colorpencil.cat_green}";
          yellow = "${colorpencil.cat_yellow}";
          blue = "${colorpencil.cat_blue}";
          magenta = "${colorpencil.cat_pink}";
          cyan = "${colorpencil.cat_sky}";
          white = "${colorpencil.cat_text}";
        };
      };
    };
  };
}
