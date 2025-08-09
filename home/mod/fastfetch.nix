{ pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        source = "nixos";
        padding = {
          right = 1;
        };
      };
      display.size = {
        binaryPrefix = "si";
        color = "blue";
        separator = " -> ";
      };
      modules = [
        {
          type = "title";
        }
        {
          type = "separator";
          string = "▔";
        }
        {
          type = "os";
          key = "╭─ ";
          format = "{3} ({12})";
          keyColor =  "32";
        }
        {
          type =  "kernel";
          key =  "├─󰒔 ";
          format =  "{1} {2}";
          keyColor =  "32";
        }
        {
          type =  "shell";
          key =  "├─$ ";
          format =  "{1} {4}";
          keyColor =  "32";
        }
        {
          type =  "packages";
          key =  "├─ ";
          keyColor =  "32";
        }
        {
          type =  "uptime";
          key =  "╰─󰔚 ";
          keyColor =  "32";
        }
        {
          type =  "cpu";
          key =  "╭─ ";
          keyColor =  "34";
          freqNdigits =  "1";
        }
              {
          type =  "gpu";
          key =  "├─󰢮 ";
          format =  "{1} {2} ({3})";
          keyColor =  "34";
        }
                    {
          type =  "memory";
          key =  "├─ ";
          keyColor =  "34";
        }
        {
          type =  "swap";
          key =  "├─󰿡 ";
          keyColor =  "34";
        }
        {
          type =  "disk";
          key =  "├─󰋊 ";
          keyColor =  "34";
        }
        {
          type =  "localip";
          key =  "╰─󱦂 ";
          keyColor =  "34";
          showIpv4 =  true;
          compact =  true;
        }
        {
          type =  "wm";
          key =  "╭─󰧨 ";
          keyColor =  "33";
        }
        {
          type =  "theme";
          key =  "├─󰉼 ";
          keyColor =  "33";
        }
        {
          type =  "icons";
          key =  "├─ ";
          keyColor =  "33";
        }
        {
          type =  "cursor";
          key =  "├─󰳽 ";
          keyColor =  "33";
        }
        {
          type =  "font";
          key =  "├─ ";
          format =  "{2}";
          keyColor =  "33";
        }
        {
          type =  "terminal";
          key =  "╰─ ";
          format =  "{3}";
          keyColor =  "33";
        }
      ];
    };
  };
}
