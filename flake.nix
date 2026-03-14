{
  description = "A very basic flake";

  inputs = {
    catppuccin.url = "github:abhinandh-s/catppuccin-nix";
    nixpkgs.url = "nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";  
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dwm = {
      url = "github:abhinandh-s/dwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    brightness = {
      url = "github:abhinandh-s/brightness";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-fonts = {
      url = "github:abhinandh-s/nix-fonts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
    variables = (import ./variables.nix);
    performFullSetup = true;
  in {

  overlays = import ./overlays { inherit inputs; };
 
  nixosConfigurations = {
      abhi = nixpkgs.lib.nixosSystem {
          specialArgs = { 
            inherit inputs outputs;
            performFullSetup = performFullSetup;  
            variables = variables;  
          };
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            inputs.sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager (import ./home/home-manager.nix)
          ];
        };
     };
  };
}
