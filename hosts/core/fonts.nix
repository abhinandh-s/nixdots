{ pkgs, ... }:
let
    victorMono = pkgs.callPackage ../../custom/pkgs/victor-mono/default.nix {};
in 
{
	fonts.packages = with pkgs; [
		victorMono
		maple-mono
		jetbrains-mono # this is included in nerd fonts but some icons are not showing up
		(nerdfonts.override {
			fonts = [
				"AnonymousPro"
				"FiraCode"
				"FiraMono"
				"Iosevka"
				"IosevkaTerm"
				"IosevkaTermSlab"
				"JetBrainsMono"
				"NerdFontsSymbolsOnly"
				"Mononoki"
				"Terminus"
				"Ubuntu"
				"UbuntuMono"
				"UbuntuSans"
			];
		})
		# -- malayalam fonts -- #
		lohit-fonts.malayalam
		texlivePackages.rit-fonts
	];
}
