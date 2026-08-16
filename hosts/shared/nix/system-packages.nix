{ pkgs, self, inputs, ... }: {
	environment.systemPackages = let
		sys = pkgs.stdenv.hostPlatform.system;
	in
		with pkgs; [
			fastfetch
			git
			hyfetch
			neovim
			nh
			pwvucontrol
			brightnessctl
			playerctl
			awww
			vesktop
			# jetbrains.idea # im going to kill jetbrains with hammers
			jetbrains.webstorm
			jetbrains.clion
			rmpc
			grim
			wl-clipboard
			prismlauncher
			nil
			gnome-themes-extra # gtk theme

			(pkgs.callPackage "${self}/packages/awww_randomize" { inherit pkgs self; })
			(pkgs.callPackage "${self}/packages/awww_switch" { inherit pkgs self; })

			inputs.niri.packages.${sys}.xwayland-satellite-unstable
			inputs.paw-bar.packages.${sys}.default
			inputs.zen-browser.packages.${sys}.default
			inputs.formatter.packages.${sys}.default
			#inputs.kidex.packages.${pkgs.stdenv.hostPlatform.system}.kidex
		];
}
