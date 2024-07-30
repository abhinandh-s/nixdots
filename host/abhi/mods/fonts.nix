{ config, pkgs, ... }:
{
	fonts.packages = with pkgs; [
		maple-mono
		jetbrains-mono # this is included in nerd fonts but some icons are not showing up
		nerdfonts
		# -- malayalam fonts -- #
		lohit-fonts.malayalam
		texlivePackages.rit-fonts
	];
}
