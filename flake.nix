{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		niri = {
			url = "github:epireyn/niri-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		paw-bar = {
			url = "github:catboylei/paw-bar";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "";
		};

		anyrun-nixos-options = {
			url = "github:catboylei/anyrun-nixos-options";
			#url = "path:/home/lei/WebstormProjects/anyrun-nixos-options";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		formatter = {
		    url = "github:itsyunaya/alejandra-opinionated";
		    inputs.nixpkgs.follows = "nixpkgs";
		};

		meowvim = {
			url = "github:itsyunaya/meowvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		#kidex = {
		#  url = "github:Kirottu/kidex";
		#  inputs.nixpkgs.follows = "nixpkgs";
		#};
	};

	outputs = inputs @ { self, nixpkgs, home-manager, niri, ... }: {
		nixosConfigurations."meow" = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {
				inherit inputs self;
			};

			modules = [
				./hosts/meow/meow-main.nix

				home-manager.nixosModules.home-manager
				niri.nixosModules.niri

				{
                    nixpkgs.overlays = [
                      (final: prev: {
                        gale = inputs.nixpkgs.legacyPackages."x86_64-linux".callPackage ./packages/gale.nix { };
                      })
                    ];
                }
			];
		};

		nixosConfigurations."mraow" = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = {
				inherit inputs self;
			};

			modules = [
				./hosts/mraow/mraow-main.nix

				home-manager.nixosModules.home-manager
				niri.nixosModules.niri
			];
		};
	};
}
