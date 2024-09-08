{ config, lib, pkgs, inputs, ... }:
let
in 
{
  imports =
    [
      ./core
      ./mods
      #./userpkgs.nix
      #./envpkgs.nix
    ];





 boot.kernelModules = ["i2c-dev"];
  services.udev.extraRules = ''
        KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

 programs.nix-ld.enable = true; # enables VSCode extensions even if they include non-Nix binaries.

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  services.udisks2.enable = true;

  security.sudo.extraRules= [
    {  users = [ "abhi" ];
    commands = [
       { command = "ALL" ;
         options= [ "NOPASSWD" ]; # not working its still asking for pass every time i mount my harddisk
      }
    ];
  }
];

  # for wireguard to set up DNS.
  # enable the systemd DNS resolver daemon.
  # services.resolved.enable = true;

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  users.users.abhi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" ];
    # extraGroups = [ "wheel" "vboxusers" "networkmanager" "netdev" "root" "video" "audio" "lp" ];
  };

  programs.neovim.defaultEditor = true;
  programs.nano.enable = true;

  users.extraGroups.vboxusers.members = [ "abhi" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
















  system.stateVersion = "24.05";
}

