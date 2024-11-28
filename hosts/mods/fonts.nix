{pkgs, ...}: let
in {

  fonts.nix-fonts = {
    enable = true;
    fonts = [
      "lora"
      "inter"
      "eb-garamond"
    ];
  };

  fonts.packages = with pkgs; [
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
  ];
}
