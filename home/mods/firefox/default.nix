{ config, pkgs, lib, inputs, ... }:
let
  # ff variants = ["firefox-bin" "firefox-esr-bin" "firefox-nightly-bin" "firefox-beta-bin"];
in
  {
  programs.firefox = {
    enable = true;
    package = inputs.firefox.packages.${pkgs.system}.firefox-bin;
    policies = lib.mkMerge [
      (import ./policies.nix { inherit config pkgs lib; })
      (import ./extensions.nix { inherit config pkgs lib; })
      { }
    ];
    profiles = {
      "abhi" = {
        id = 0;
        isDefault = true;
        userContent = import ./userContent.nix;
        userChrome = import ./userChrome.nix;
        settings = import ./preferences.nix;
        containers = import ./containers.nix; 
        search = import ./search.nix;
      };
    };
  };
}
