{
  description = "Abhi's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    roxide = {
      url = "github:abhinandh-s/roxide";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dwm = {
      url = "github:abhinandh-s/dwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    brightness = {
      url = "github:abhinandh-s/brightness";
    };
    nix-fonts = {
      url = "github:abhinandh-s/nix-fonts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    disko,
    roxide,
    dwm,
    nix-fonts,
    brightness,
    nixpkgs-unstable,
    sops-nix,
    home-manager,
    sddm-sugar-candy-nix,
    ...
  }: let
    randomNumber = builtins.readFile ./random.txt; # to keep home-manager.backupFileExtension happy
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  in {
    nixosConfigurations.abhi = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        disko.nixosModules.disko
        ./disko.nix
        ./host/configuration.nix
        (
          {...}: {
            nixpkgs.overlays = [overlay-unstable];
          }
        )
        sops-nix.nixosModules.sops
        roxide.nixosModules.roxide
        #  lyricz.nixosModules.lyricz
        sddm-sugar-candy-nix.nixosModules.default
        {
          nixpkgs = {
            overlays = [sddm-sugar-candy-nix.overlays.default];
          };
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = randomNumber;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.abhi = {
              imports = [
                ./home/home.nix
                roxide.homeManagerModules.roxide
                brightness.homeManagerModules.brightness
              ];
              _module.args.colorpencil = import ./custom/themes/colorpencil;
            };
            sharedModules = [inputs.sops-nix.homeManagerModules.sops];
            extraSpecialArgs = {
              inherit self inputs;
            };
          };
        }
      ];
      specialArgs = {
        performFullSetup = true;
        inherit inputs;
      };
    };
  };
}
