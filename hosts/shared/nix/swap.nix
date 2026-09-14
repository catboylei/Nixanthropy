{ ... }: {
	swapDevices = [{
		device = "/var/lib/swapfile";
		size = 16 * 1024; # 16 gb
		# see https://wiki.nixos.org/wiki/Swap#discard
		options = [ "discard" ];
	}];

	boot.zswap.enable = true;
}
