{
  pkgs,
  lib,
  ...
}: {
  home = {
    username = "abhi";
    homeDirectory = "/home/abhi";
    stateVersion = "24.05";
  };

  imports = [
    ./mods
    ./core
    ./pkgs.nix
    ../custom/options/rbw.nix
    ../custom/options/oculante.nix
  ];

  my.colorpencil.option = "red";

  programs.oculante = {
    enable = true;
    settings = {
      accent_color = [250 131 202];
      background_color = [0 0 0];
      vsync = true;
      force_redraw = false;
      shortcuts = {
        AlwaysOnTop = ["T"];
        Fullscreen = ["F"];
        InfoMode = ["I"];
        EditMode = ["E"];
        NextImage = ["Right"];
        FirstImage = ["Home"];
        LastImage = ["End"];
        PreviousImage = ["Left"];
        RedChannel = ["R"];
        GreenChannel = ["G"];
        BlueChannel = ["B"];
        AlphaChannel = ["A"];
        RGBChannel = ["U"];
        RGBAChannel = ["C"];
        ResetView = ["V"];
        ZoomOut = ["Minus"];
        ZoomIn = ["Equals"];
        ZoomActualSize = ["Key1"];
        ZoomDouble = ["Key2"];
        ZoomThree = ["Key3"];
        ZoomFour = ["Key4"];
        ZoomFive = ["Key5"];
        CompareNext = ["C" "LShift"];
        PanLeft = ["LShift" "Left"];
        PanRight = ["LShift" "Right"];
        PanUp = ["LShift" "Up"];
        PanDown = ["Down" "LShift"];
        DeleteFile = ["Delete"];
        LosslessRotateRight = ["RBracket"];
        LosslessRotateLeft = ["LBracket"];
        Copy = ["C" "LControl"];
        Paste = ["LControl" "V"];
        Browse = ["LControl" "O"];
        Quit = ["Q"];
        ZenMode = ["Z"];
      };
      keep_view = false;
      max_cache = 30;
      show_scrub_bar = false;
      wrap_folder = true;
      keep_edits = false;
      favourite_images = [
        "/home/abhi/projects/github/nixdots/assets/wallpaper/wallpaper-pink.avif"
      ];
      title_format = "{APP} | {VERSION} | {FULLPATH}";
      info_enabled = true;
      edit_enabled = false;
      window_geometry = [
        [1061 37]
        [782 469]
      ];
      last_open_directory = "/home/abhi";
      show_checker_background = false;
      show_minimap = false;
      show_frame = false;
      current_channel = "Rgba";
      svg_scale = 1.0;
      zen_mode = false;
      theme = "Dark";
      linear_mag_filter = false;
      fit_image_on_window_resize = true;
      zoom_multiplier = 1.0;
      borderless = false;
    };
  };

  services.rbw = {
    enable = true;
    package = with pkgs; (rbw.override {
      withFzf = true;
      withRofi = true;
      withPass = false;
    });
    settings = {
      email = "ugabhi@proton.me";
      sync_interval = 3600;
      pinenty = "pinentry";
      client_cert_path = null;
      sso_id = null;
      base_url = null;
      identity_url = null;
      ui_url = null;
      notifications_url = null;
      lock_timeout = 3600000;
    };
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;
}
