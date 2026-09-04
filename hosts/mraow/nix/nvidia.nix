{ config, ... }: {
    # i am a creature of hate
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.graphics = {
	    enable = true;
	};
	hardware.nvidia = {
		open = true;
		modesetting.enable = true;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
	};
	boot.blacklistedKernelModules = [ "nouveau" ];
	# i HATE
}
