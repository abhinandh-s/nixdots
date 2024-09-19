{ config, pkgs, ... }:
{
  home.username = "abhi";
  home.homeDirectory = "/home/abhi";
  home.stateVersion = "24.05";

  home.sessionPath = [ "$HOME/.cargo/bin" ];

  imports = [
    ./mods
    ./core
    ./pkgs.nix
  ];


  home.file.".local/bin/slstatus".source = ../custom/bin/slstatus;
  
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

  programs.kitty = {
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

  programs = {
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
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
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
  home.file.".background-image".source = ../assets/wallpaper/macos-blue.png;

  programs.home-manager.enable = true;

}
