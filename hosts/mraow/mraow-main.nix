# 🐾🐾🐾🐾🐾🐾🐾🐾
{ self, ... }: {
    system.stateVersion = "26.05";

    networking.hostName = "mraow";

	imports = [
		"${self}/hosts/shared/shared-main.nix"

		./nix/nvidia.nix
		./nix/pam.nix
        	./nix/hardware-configuration.nix
	];

	home-manager.users.lei = ./mraow-home.nix;
}
