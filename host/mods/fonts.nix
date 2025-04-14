{
  pkgs,
  inputs,
  ...
}: let
  # commit-mono = inputs.commit-mono;
  fonts = inputs.nix-fonts.packages;
in {
  # fonts.nix-fonts = {
  #   enable = true;
  #   fonts = [
  #     "lora"
  #     "inter"
  #     "eb-garamond"
  #   ];
  # };

  fonts.packages = with pkgs;
    [
      maple-mono
      # LoraFont
      # InterFont
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "FiraMono"
          "Iosevka"
          "IosevkaTerm"
          "IosevkaTermSlab"
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
      # "commit-mono"
    ]);
}
