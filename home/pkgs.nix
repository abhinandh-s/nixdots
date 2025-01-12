{
  config,
  pkgs,
  ...
}: let
  install_base = true;
  install_misc = true; # Change this to false to skip misc_packages
  install_languages = true;

  base_packages =
    if install_base
    then
      with pkgs; [
        anki-bin
        lazygit
        # tokyonight-gtk-theme
      ]
    else [];

  misc_packages =
    if install_misc
    then
      with pkgs; [
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
        unstable.nixd
        nixfmt-rfc-style
        alejandra
        tree-sitter
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
      kdePackages.gwenview
      lynx
      librewolf
      git
      evince
      pulsemixer
      hut
      zathura
      unstable.neovim
      discord
      telegram-desktop
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
      (writeShellScriptBin "fo"
        /*
        bash
        */
        ''
          ${fzf}/bin/fzf -e --cycle --walker-skip=.git,.direnv | xargs -r xdg-open
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
