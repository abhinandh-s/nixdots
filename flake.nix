{
  description = "NixOS configuration with two or more channels";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/NUR";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      # Optional, by default this flake follows nixpkgs-unstable.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay/da2f552d133497abd434006e0cae996c0a282394";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{
    self,
    nixpkgs,
    nixpkgs-unstable,
    nur,
    home-manager,
    sddm-sugar-candy-nix,
    spicetify-nix,
    ...
    }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

      };
    in {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./host/abhi/configuration.nix
          sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = "bkp1";
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.abhi = {
                imports = [
                  ./home/abhi/home.nix
                  spicetify-nix.homeManagerModules.default
                ];
                _module.args.theme = import ./custom/themes/base16;
              };
              extraSpecialArgs = {
                inherit self inputs;
              };
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
}
