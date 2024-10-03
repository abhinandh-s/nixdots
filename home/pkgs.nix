{ pkgs, ... }:
let
  install_themes = true; 
  install_misc = true; # Change this to false to skip misc_packages
  install_languages = true;

  theme_packages = if install_themes then with pkgs; [ 
    tokyonight-gtk-theme
    (whitesur-icon-theme.override {
      themeVariants = ["all"];
      alternativeIcons = true;
    })
    (catppuccin-papirus-folders.override {
      accent = "lavender";
      flavor = "mocha";
    })
  ] else [];

  misc_packages = if install_misc then with pkgs; [ 
    gimp-with-plugins
    inkscape-with-extensions
    krita
    libreoffice-fresh
    youtube-music
  ] else [];

  lang_packages = if install_languages then with pkgs; [ 
    python3
    lua-language-server
    lua
    luajitPackages.luarocks
    luajitPackages.jsregexp
    nodePackages_latest.nodejs
    unstable.nixd
    pandoc
    ltex-ls
    languagetool
    tree-sitter
    texlive.combined.scheme-full
    tree-sitter-grammars.tree-sitter-latex
  ] else [];

  home_pkgs = with pkgs; [
    alacritty
    fasd
    oculante # image viewer in rust
    nomacs
    kdePackages.gwenview
    lynx
    qbittorrent
    tutanota-desktop
    librewolf
    git
    kdePackages.okular
    pulsemixer
    hut
    zathura
    unstable.neovim
    yazi
    telegram-desktop
    signal-desktop
    bitwarden-desktop
    (rbw.override {
      withFzf = true;
      withRofi = true;
      withPass = false;
    })
  ];
in
  {
  home.packages = misc_packages ++ home_pkgs ++ lang_packages ++ theme_packages; 
}
