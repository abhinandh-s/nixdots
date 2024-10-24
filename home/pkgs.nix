{
  config,
  pkgs,
  ...
}: let
  install_base = false;
  install_misc = true; # Change this to false to skip misc_packages
  install_languages = true;

  base_packages =
    if install_base
    then
      with pkgs; [
        tokyonight-gtk-theme
      ]
    else [];

  misc_packages =
    if install_misc
    then
      with pkgs; [
        gimp-with-plugins
        inkscape-with-extensions
        krita
        libreoffice-fresh
        (calibre.override {
          unrarSupport = true;
        })
      ]
    else [];

  lang_packages =
    if install_languages
    then
      with pkgs; [
        python3
        lua-language-server
        lua
        luajitPackages.luarocks
        luajitPackages.jsregexp
        nodePackages_latest.nodejs
        unstable.nixd
        alejandra
        pandoc
        ltex-ls
        languagetool
        tree-sitter
        texlive.combined.scheme-full
        tree-sitter-grammars.tree-sitter-latex
      ]
    else [];

  home_pkgs = with pkgs;
    [
      alacritty
      maestral # dropbox
      just
      nomacs
      neomutt
      clipcat
      protonmail-bridge
      kdePackages.gwenview
      lynx
      urlscan
      qbittorrent
      tutanota-desktop
      librewolf
      git
      evince
      pulsemixer
      hut
      zathura
      unstable.neovim
      telegram-desktop
      signal-desktop
      #  bitwarden-desktop
      thunderbird
      (slstatus.override {
        conf = builtins.readFile ../custom/configs/slstatus/config.h;
      })
      (writeShellScriptBin "ff"
        /*
        bash
        */
        ''
          ${fzf}/bin/fzf -e --cycle --walker-skip=.git,.direnv | xargs -r nvim
        '')
      (writeShellScriptBin "fzfr"
        /*
        bash
        */
        ''
          ${fzf}/bin/fzf -e --cycle --walker-skip=.git,.direnv | xargs -r rm
        '')
      (writeShellScriptBin "enc.sh"
        /*
        bash
        */
        ''
          ${age}/bin/age -e -r age1jmcmqq4jpzcutzeajxavlapee57rhp3gzprlc5se8vvsk9ej3ezq7nh94p $1 > $1.age
        '')
      (writeShellScriptBin "dec.sh"
        /*
        bash
        */
        ''
          ${age}/bin/age -d -i ~/.local/share/age/key.txt $1 > $2
        '')
    ]
    ++ (
      if (config.programs.yazi.enable == true)
      then
        with pkgs; [
          imagemagickBig
        ]
      else []
    )
    ++ (
      if (config.programs.fish.enable == true)
      then
        with pkgs; [
          fasd
        ]
      else []
    );
in {
  home.packages = misc_packages ++ home_pkgs ++ lang_packages ++ base_packages;
}
