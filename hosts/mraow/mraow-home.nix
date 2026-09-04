{ self, ... }: {
	home.stateVersion = "26.05";

	imports = [
	    "${self}/hosts/shared/shared-home.nix"

		./home-manager/programs/niri.nix
	];
}
