# 🐾🐾🐾🐾🐾🐾🐾🐾
{ self, ... }: {
    system.stateVersion = "26.05";

    networking.hostName = "meow";

	imports = [
		"${self}/hosts/shared/shared-main.nix"

		./nix/nvidia.nix
        ./nix/hardware-configuration.nix
	];

	home-manager.users.lei = ./meow-home.nix;
}