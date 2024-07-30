{
  inputs,
  pkgs,
  colorpencil,
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
        popupLyrics
        seekSong
        adblock
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
        ncsVisualizer
      ];
      colorScheme = "custom";
      customColorScheme = {
        text = stripHexPrefix colorpencil.base01;
        subtext = stripHexPrefix colorpencil.base09;
        sidebarText = stripHexPrefix colorpencil.base01;
        main = stripHexPrefix colorpencil.base00;
        sidebar = stripHexPrefix colorpencil.base07;
        player = stripHexPrefix colorpencil.base00;
        card = stripHexPrefix colorpencil.base00;
        shadow = stripHexPrefix colorpencil.base02;
        selectedRow = stripHexPrefix colorpencil.base0A;
        button = stripHexPrefix colorpencil.base07;
        buttonActive = stripHexPrefix colorpencil.base07;
        buttonDisabled = stripHexPrefix colorpencil.base02;
        tabActive = stripHexPrefix colorpencil.base0A;
        notification = stripHexPrefix colorpencil.base0A;
        notificationError = stripHexPrefix colorpencil.base03;
        misc = stripHexPrefix colorpencil.base01;
      };
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
