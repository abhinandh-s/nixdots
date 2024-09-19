{ config, pkgs, ... }:
{

  programs.eza = {
    enable = true;
    icons = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [



    (whitesur-icon-theme.override {
      themeVariants = ["all"];
      alternativeIcons = true;
    })

    (catppuccin-papirus-folders.override {
      accent = "lavender";
      flavor = "mocha";
    })

    alacritty
    tokyonight-gtk-theme

    # redshift
    youtube-music
    lynx


    qbittorrent
    ltex-ls
    pandoc
    languagetool

    tutanota-desktop
    unstable.librewolf
    git
    kdePackages.okular

    hut
    tree-sitter
    texlive.combined.scheme-full
    tree-sitter-grammars.tree-sitter-latex
    zathura


    unstable.neovim
    #  unstable.libreoffice-fresh
    #  unstable.youtube-music
    yazi
    telegram-desktop
    # unstable.signal-desktop
    python3
    lua-language-server
    lua
    luajitPackages.luarocks
    luajitPackages.jsregexp
    nodePackages_latest.nodejs
    unstable.nixd
  ];
}
