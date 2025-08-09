{inputs, variables, ... }:
let
  randomNumber = builtins.readFile ../random.txt; # to keep home-manager.backupFileExtension happy
in {
home-manager = {
  useGlobalPkgs = true;
  useUserPackages = true;
  backupFileExtension = randomNumber;
      users.abhi = {
      imports =  [
        ./.
      ];
  };
  sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
      inputs.catppuccin.homeManagerModules.default
    ];    
    extraSpecialArgs = {
      inherit inputs;
      userSettings = variables;
  };
};
}
