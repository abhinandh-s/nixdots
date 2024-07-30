{ config, pkgs, ... }:
{
   nixpkgs.overlays = [
    (import ../../custom/overlays/betterlockscreen)
  ];

   nixpkgs.config.packageOverrides = pkgs: {
    spotify-adblock = pkgs.callPackage ../../custom/overlays/spotify-adblock/spotifyadblock.nix { };
   };

  users.users.abhi.packages = with pkgs; [

    (dmenu.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    patches = [
      # You can specify local patches
        #./path/to/local.diff
      # Fetch them directly from `st.suckless.org`
         (fetchpatch {
         url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff";
        sha256 = "sha256-g7ow7GVUsisR2kQ4dANRx/pJGU8fiG4fR08ZkbUFD5o=";
        })
                  (fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/dracula/dmenu-dracula-20211128-d78ff08.diff";
          sha256 = "sha256-gdWMymgGNfU0rA2inl1bqlGyLMKyBpB3zhDuPn61Ga8=";
           })
    ];
      #   configFile = writeText "config.def.h" (builtins.readFile ../../custom/overlays/st/config.h);
      #   postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
  }))

    betterlockscreen
    vim
    #   (import ../../home/abhi/mods/spotify-adblock/default.nix )
    unstable.neovim
    #spotify-adblock
    alacritty
    cmake
    ripgrep
    playerctl
    neofetch
    unstable.librewolf
    #unstable.youtube-music
    xclip
    gcc
    pkg-config
    gnumake
    gnupatch
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    pcmanfm
    git
    feh
    fzf
    #mpv
    #vlc
    dconf
    rofi
    networkmanager
    #unstable.telegram-desktop

    unstable.lua
    unstable.luajitPackages.luarocks
    unstable.luajitPackages.jsregexp
    unstable.nodePackages_latest.nodejs
    unstable.nodejs_22

    unzip
    hashcat
    hashcat-utils
    john
    nmap

    font-manager
    tree-sitter-grammars.tree-sitter-latex
    #calibre
    #kdePackages.okular
    #libreoffice-fresh
    fd
    ffmpeg
    pulsemixer
    #lxappearance
    tree-sitter

    #unstable.krita
    #unstable.inkscape-with-extensions
    #unstable.gimp


    #where-is-my-sddm-theme
    #sddm-chili-theme

    unstable.rustc
    unstable.rustfmt
    unstable.cargo
    unstable.clippy
    unstable.libudev-zero

    unstable.yazi

    #virtualbox


    #calibre
    cinnamon.nemo-with-extensions

    texlive.combined.scheme-full
    #zathura


    tree
  ];
}
