{
pkgs,
userSettings,
...
}:
{
  home.username = userSettings.name;
  home.homeDirectory = "/home/" + userSettings.name;
  home.stateVersion = "25.05";
  imports = [ 
    ./lib
    ./mod
    ./secrets
  ];
  home.packages = with pkgs; [
    (slstatus.override {
      conf = builtins.readFile ../dots/slstatus/config.h;
    })
  ];
  home.optional.packages = {
    enable = userSettings.full_setup;
    packages = with pkgs; [
      xorg.libX11 # for slstatus
      alejandra
      fasd
      git-cliff
      font-manager
      unstable.rust-analyzer
      rust-bin.stable.latest.default
      unstable.neovim     
      librewolf
      gcc
      cmake
      just
      age
      sops
      nemo-with-extensions
      libnotify
      evince
      telegram-desktop
    ];
  };
} 
