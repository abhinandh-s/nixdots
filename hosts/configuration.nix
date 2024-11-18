{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./mods
  ];

boot.kernelPackages = pkgs.linuxPackages_zen;

program.roxide.enable = true;
  /*
  program.lyricz = {
    enable = true;
    settings = {
      dir = {
        image = true;
      };
      input = "test";
    };
  };
*/

  services.clipcat = {
    enable = true;
    package = pkgs.clipcat;
  };

  # virtualisation.virtualbox = {
  #   host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  #   guest = {
  #     enable = true;
  #     draganddrop = true;
  #   };
  # };

  boot.kernelModules = ["i2c-dev"];
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment = {
    shells = with pkgs; [fish];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };

  programs.fish.enable = true;

  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };

  programs.mtr.enable = true; # A network diagnostics tool
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };

  services.udisks2 = {
    enable = true;
    mountOnMedia = true;
  };

  nixpkgs.config.allowUnfree = true;

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

  programs.neovim.defaultEditor = true;
  programs.nano.enable = false;

  system.stateVersion = "24.05";
}
