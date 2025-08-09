{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./mod
      ./hardware-configuration.nix
    ];


  nixpkgs = {
    overlays = [
      inputs.sddm-sugar-candy-nix.overlays.default
      inputs.catppuccin.overlays.default
      outputs.overlays.unstable-nixpkgs      
      (import inputs.rust-overlay)
    ];
    config.allowUnfree = true;
  };

 
   networking.hostName = "nixos";
   networking.networkmanager.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      system-features = [
        "big-parallel"
      ];
    };
    gc = {
      # automatic = true;
      # dates = "weekly";
      # options = "--delete-older-than 7d";
    };
  };

services.clipcat = {
    enable = true;
    package = pkgs.clipcat;
  };

  boot.kernelModules = ["i2c-dev"];
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment = {
    shells = with pkgs; [fish];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "ghostty";
    };
  };
  programs.neovim.defaultEditor = true;
  programs.nano.enable = false;
  programs.fish.enable = true;

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "alacritty.desktop"
      ];
    };
  };

  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };




  system.stateVersion = "25.05";
}

