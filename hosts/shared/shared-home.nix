{ pkgs, ... }: {
	home.stateVersion = "26.05";

	# variant list and previews : https://github.com/TeddyBearKilla/Afterglow-Cursors-Recolored/tree/main/previews
	home.file.".icons/default".source = "${pkgs.afterglow-cursors-recolored}/share/icons/Afterglow-Recolored-Dracula-Pink/";

	imports = [
		./home-manager/programs/hyprlock.nix
		./home-manager/programs/anyrun.nix
		./home-manager/programs/fish.nix
		./home-manager/programs/kitty.nix
		./home-manager/programs/git.nix
		./home-manager/programs/rmpc.nix

		./home-manager/services/mpd.nix
		#./home-manager/services/cliphist.nix
	];
}