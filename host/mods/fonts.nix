{
  pkgs,
  inputs,
  ...
}: let
  fonts = inputs.nix-fonts.packages;
in {
  fonts.packages = with pkgs;
    [
      maple-mono
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "FiraMono"
          "JetBrainsMono"
          "NerdFontsSymbolsOnly"
          "Terminus"
          "Ubuntu"
          "UbuntuMono"
          "UbuntuSans"
        ];
      })
      # -- malayalam fonts -- #
      # lohit-fonts.malayalam
      # texlivePackages.rit-fonts
    ]
    ++ (with fonts; [
      lora
      commit-mono
      Iosevka
      IosevkaAile
      IosevkaEtoile
    ]);
}
