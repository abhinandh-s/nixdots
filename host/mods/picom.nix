{
  pkgs,
  config,
  ...
}: {
  services.picom = {
    enable = true;
    package = pkgs.picom-pijulius;
    fade = true;
    shadow = false;
    shadowOpacity = 0.8;
    activeOpacity = 1.0;
    menuOpacity = 0.8; # Opacity of dropdown and popup menu.
    opacityRules = [
      "95:class_g = 'URxvt' &amp;&amp; !_NET_WM_STATE@:32a"
      "0:_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];
    shadowExclude = [
      "window_type *= 'menu'"
      "name ~= 'Firefox$'"
      "focused = 1"
    ];
    backend = "xrender";
    wintypes = {
      popup_menu = {opacity = config.services.picom.menuOpacity;};
      dropdown_menu = {opacity = config.services.picom.menuOpacity;};
    };
    # package = pkgs.picom;
    settings = {
      #################################
      #       General Settings        #
      #################################
      vsync = false;
      backend = "xrender";
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      detect-rounded-corners = true;
      detect-client-opacity = true;
      refresh-rate = 60;
      detect-transient = true;
      detect-client-leader = true;
      log-level = "info";
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };
  };
}
