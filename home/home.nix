{ config, pkgs, ... }:
{
  home = {
    username = "abhi";
    homeDirectory = "/home/abhi";
    stateVersion = "24.05";
  };

  imports = [
    ./mods
    ./core
    ./pkgs.nix
  ];

  home.file = {
    ".local/bin/slstatus".source = ../custom/bin/slstatus;
    ".background-image".source = ../assets/wallpaper/macos-blue.png;
  };
  # covered all options
  services.redshift = {
    enable = true;
    tray = false;
    package = pkgs.redshift;
    provider = "manual"; # one of "manual", "geoclue2"
    latitude = 9.5475023;
    longitude = 76.7777895;
    # dawnTime = "6:00-7:45"; # must be HH:MM in 24-hour format
    # duskTime = "18:35-20:15";
    # settings = {
    #   redshift = {
    #     adjustment-method = "randr";
    #   };
    #   randr = {
    #     screen = 0;
    #   };
    # };
    # temperature.night = 3700;
    # temperature.day = 5500;
    # enableVerboseLogging = false;
  };


  programs = {
    bat = {
      enable = true;
      package = pkgs.bat;
      extraPackages = with pkgs.bat-extras; [ batdiff batman batgrep batwatch ];
      config = {
        map-syntax = [
          "*.jenkinsfile:Groovy"
          "*.props:Java Properties"
        ];
        pager = "less -FR";
        theme = "TwoDark";
      };
      syntaxes = {
        gleam = {
          src = pkgs.fetchFromGitHub {
            owner = "molnarmark";
            repo = "sublime-gleam";
            rev = "2e761cdb1a87539d827987f997a20a35efd68aa9";
            hash = "sha256-Zj2DKTcO1t9g18qsNKtpHKElbRSc9nBRE2QBzRn9+qs=";
          };
          file = "syntax/gleam.sublime-syntax";
        };
      };
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "catppuccin";
            repo = "bat"; # Bat uses sublime syntax for its themes
            rev = "d3feec47b16a8e99eabb34cdfbaa115541d374fc";
            sha256 = "sha256-s0CHTihXlBMCKmbBBb8dUhfgOOQu9PBCQ+uviy7o47w=";
          };
          file = "Catppuccin Mocha.tmTheme";
        };
        #         dracula = {
        #   src = pkgs.fetchFromGitHub {
        #     owner = "dracula";
        #     repo = "sublime"; # Bat uses sublime syntax for its themes
        #     rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
        #     sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
        #   };
        #   file = "Dracula.tmTheme";
        # };
      };
    };
    zoxide = {
      enable = true;
      package = pkgs.zoxide;
      enableNushellIntegration = true;
      options = [
        # "--no-aliases"
      ];
    };
    zsh = {
      enable = true;
      initExtraFirst = "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#7f849c'";
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        ll = "ls -l";
        gc = "git clone";
        develop = "nix develop --command 'zsh'";
        rdevelop = "cd ~/github/nixdots/custom/mods/shells/rust && nix develop --command 'zsh' && echo 'Environment ready!'";
        gitpush = "git add -A && git status && git commit -m '-' && git status && git push";
        update = "sudo nixos-rebuild switch --flake .";
        z = "eza -lA --git-ignore --hyperlink --total-size --time-style=relative --time=modified -o -s modified";
        getrust = "cp ~/projects/github/nix-shells/rust/* .";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
    };
    eza = {
      enable = true;
      # icons = true;
      enableNushellIntegration = true;
      # enableZshIntegration = true; # will create aliase for ls command and replace it with eza
    };
    kitty = {
      enable = true;
      keybindings = {
        # tab
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
          "alt+3" = "goto_tab 3";
          "alt+4" = "goto_tab 4";
          "ctrl+v" = "paste_from_clipboard";
          "ctrl+c" = "copy_to_clipboard";
        };
        settings = {
          font_family = "FiraCode Nerd Font Mono";
          font_size = "12.6";
          window_padding_width = 20;
          exe_search_path = "+/etc/profiles/per-user/${config.home.username}/bin";
          shell = "zsh";
          editor = "nvim";
          copy_on_select = "clipboard";
          confirm_os_window_close = 0;
          hide_window_decorations = "no";
          background_opacity = "0.8";
          background_blur = 50;
          notify_on_cmd_finish = "unfocused"; # Only send a notification when the window does not have keyboard focus.

        };
        theme = "Tokyo Night";
      };
    };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-BL-LB";
      package = pkgs.pop-gtk-theme;
    };
    iconTheme = {
      name= "Papirus-Dark"; # Mint-Y-Pink
      package = pkgs.nordzy-icon-theme; # nordzy-icon-theme # cinnamon.mint-y-icons
    };
    cursorTheme = {
      name = "Bibata-Original-Ice";
      # package = pkgs.catppuccin-cursors.mochaPink      
      # package = pkgs.bibata-cursors;
      size = 14;
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;

}
