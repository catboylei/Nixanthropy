{ config, lib, pkgs, modulesPath, ... }:

{
	imports = 
		[ (modulesPath + "/installer/scan/not-detected.nix")
		];

	boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [  ];
	boot.kernelModules = [ "kvm-amd" ];
	boot.extraModulePackages = [  ];

	fileSystems."/" =
		{   device = "/dev/disk/by-uuid/3821787c-c2e3-4958-b04e-bbd5fece4bf1";
			fsType = "ext4";		
		};

	fileSystems."/boot" =
		{   device = "/dev/disk/by-uuid/77AA-8A57";
			fsType = "ufat";
			options = [ "fmask=0077" "dmask=0077" ];
		};

	swapDevices = [  ];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
