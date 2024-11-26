{ pkgs, ... }:
let
  LoraFont = pkgs.callPackage ../../custom/pkgs/fonts/lora/default.nix { stdenvnocc = pkgs.stdenv; };
in 
{
	fonts.packages = with pkgs; [
		maple-mono
    LoraFont
    # jetbrains-mono # this is included in nerd fonts but some icons are not showing up
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
