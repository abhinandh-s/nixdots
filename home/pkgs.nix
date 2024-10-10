{ config, pkgs, ... }:
let
  install_themes = false; 
  install_misc = true; # Change this to false to skip misc_packages
  install_languages = true;

  theme_packages = if install_themes then with pkgs; [ 
    tokyonight-gtk-theme
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
    neomutt
    protonmail-bridge
    kdePackages.gwenview
    lynx
    urlscan
    qbittorrent
    tutanota-desktop
    librewolf
    git
    kdePackages.okular
    evince
    pulsemixer
    hut
    zathura
    unstable.neovim
    telegram-desktop
    signal-desktop
    bitwarden-desktop
    (rbw.override {
      withFzf = true;
      withRofi = true;
      withPass = false;
    })
  ] ++ 
    (if (config.programs.yazi.enable == true)
      then with pkgs; [
        imagemagickBig
      ]
    else []);
in
  {
  home.packages = misc_packages ++ home_pkgs ++ lang_packages ++ theme_packages;
}
