{ config, pkgs, ... }:
{
programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    dracula-theme.theme-dracula
    vscodevim.vim
    yzhang.markdown-all-in-one
  ];
};



  home.packages = with pkgs; [






  




    qbittorrent
    alacritty
    ltex-ls
#   pavucontrol
 #   pandoc
 #   languagetool
 #   vulkan-tools
 #   mesa
 #   mesa_drivers
 #   mesa_glu
 #   libvdpau-va-gl

    (whitesur-icon-theme.override {
      themeVariants = ["all"];
      alternativeIcons = true;
    })

    (catppuccin-papirus-folders.override {
      accent = "lavender";
      flavor = "mocha";
    })

    tokyonight-gtk-theme


 # lxappearance

    cmake
    ripgrep
    playerctl
   # neofetch
    xclip
    gcc
    tutanota-desktop
    unstable.librewolf
    pkg-config
    gnumake
    gnupatch
    git
    kdePackages.okular # pdf viewer
   # ghostscript_headless # for pdfs compression and other sort of things
   # qpdf # for removing metadata from pdfs
    feh
    fzf
    vlc
    dconf
    hut
    unzip
    font-manager
    tree-sitter-grammars.tree-sitter-latex
    fd
   ffmpeg-full
   pulsemixer
    tree-sitter
   cinnamon.nemo-with-extensions
   texlive.combined.scheme-full
   zathura
    tree
    btop
    htop
    cava
    xsel # for clipboard
    mpc-cli
    openssl_3_3
    
    xorg.libxcb
    xorg.libXrender
    xorg.libXfixes
    xorg.libXext
    xorg.libX11
    xorg.libXft
    xorg.libXinerama

    unstable.neovim
  #  unstable.libreoffice-fresh
  #  unstable.youtube-music
  yazi
  telegram-desktop
 # unstable.signal-desktop
  #  unstable.krita
  #  unstable.inkscape-with-extensions
  #  unstable.gimp
  python3
  unstable.lua-language-server
  #  unstable.ltex-ls
  #  unstable.go
  #  unstable.gopls
   unstable.lua
  #  unstable.templ
   unstable.luajitPackages.luarocks
   unstable.luajitPackages.jsregexp
   unstable.nodePackages_latest.nodejs
    #  unstable.nodejs_22
  #  unstable.pyright
  unstable.nixd
 #   unstable.rustc
    # unstable.rustup
 #   unstable.rust-analyzer
  #  unstable.rustfmt
  #  unstable.cargo
   # unstable.clippy
  #  unstable.libudev-zero

    # (ncmpcpp.override { visualizerSupport = true; })
  ];
}
