{
  inputs,
  pkgs,
  theme,
  ...
}:

{
  programs.spicetify =
    let
      stripHexPrefix = color: builtins.substring 1 6 color;
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      windowManagerPatch = true;
      theme = spicePkgs.themes.dribbblish;
      enabledExtensions = with spicePkgs.extensions; [
        shuffle
        history
        fullAppDisplay
        hidePodcasts
        keyboardShortcut
        seekSong
        adblock
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
        ncsVisualizer
      ];
      colorScheme = "Purple";
      # customColorScheme = {
      #   text = stripHexPrefix theme.base01;
      #   subtext = stripHexPrefix theme.base09;
      #   sidebarText = stripHexPrefix theme.base01;
      #   main = stripHexPrefix theme.base00;
      #   sidebar = stripHexPrefix theme.base06;
      #   player = stripHexPrefix theme.base00;
      #   card = stripHexPrefix theme.base00;
      #   shadow = stripHexPrefix theme.base02;
      #   selectedRow = stripHexPrefix theme.base0A;
      #   button = stripHexPrefix theme.base06;
      #   buttonActive = stripHexPrefix theme.base06;
      #   buttonDisabled = stripHexPrefix theme.base02;
      #   tabActive = stripHexPrefix theme.base0A;
      #   notification = stripHexPrefix theme.base0A;
      #   notificationError = stripHexPrefix theme.base03;
      #   misc = stripHexPrefix theme.base01;
      # };
    };

  xdg.desktopEntries = {
    spotify = {
      name = "Spotify";
      type = "Application";
      icon = "spotify";
      exec = "spotify";
      terminal = false;
      genericName = "Music Player";
      categories = [
        "Audio"
        "Music"
        "Player"
        "AudioVideo"
      ];
    };
  };
}

# Extends Spotify's default keybinds (toggle help modal with ?) with vim like shortcuts. Less time touching the mouse.

#    Ctrl Tab / Ctrl Shift Tab: Navigate items in left sidebar menu.
#   PageUp/PageDown: Force scroll up/down app page only (because mouse focus is sometimes in sidebar region and they scroll sidebar instead of app page).
#   J/K: Scroll app page up/down. *Tips hat to Vim users*
#   G/Shift G: Scroll to top or bottom
#   F: Open up keyboard-driven navigation. Hit correct key sequences to open up place you want to go:

