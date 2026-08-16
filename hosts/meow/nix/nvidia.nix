{ ... }: {
    # i am a creature of hate
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.graphics.enable = true;
	hardware.nvidia = {
		open = true;

		prime = {
			intelBusId = "PCI:0@0:2:0";
			nvidiaBusId = "PCI:1@0:0:0";

			sync.enable = true;
		};
	};
	# i HATE
}