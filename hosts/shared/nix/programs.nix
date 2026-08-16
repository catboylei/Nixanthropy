{ inputs, pkgs, ... }: {
	programs = {
		niri = {
			enable = true;
			package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
		};
		steam.enable = true;
		fish.enable = true;
	};

	networking.networkmanager.enable = true;
	services.upower.enable = true;

	services.pipewire = {
		enable = true;
		alsa.enable = true;
		pulse.enable = true;
	};
}
