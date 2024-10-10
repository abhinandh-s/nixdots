{
inputs,
pkgs,
colorpencil,
config,
...
}:
let
  selectedColor = builtins.getAttr (config.my.colorpencil.option) colorpencil;
in
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
      ];
      colorScheme = "custom";
      customColorScheme = {
        text = stripHexPrefix selectedColor.text; # text
        subtext = stripHexPrefix selectedColor.subtext; 
        sidebarText = stripHexPrefix selectedColor.text;
        main = stripHexPrefix selectedColor.background;
        sidebar = stripHexPrefix selectedColor.foreground;
        player = stripHexPrefix selectedColor.background;
        card = stripHexPrefix selectedColor.background;
        shadow = stripHexPrefix selectedColor.shadow;
        selectedRow = stripHexPrefix selectedColor.foreground;
        button = stripHexPrefix selectedColor.foreground;
        buttonActive = stripHexPrefix selectedColor.text;
        buttonDisabled = stripHexPrefix selectedColor.shadow;
        tabActive = stripHexPrefix selectedColor.shadow;
        notification = stripHexPrefix selectedColor.background;
        notificationError = stripHexPrefix selectedColor.foreground;
        misc = stripHexPrefix selectedColor.text;
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
