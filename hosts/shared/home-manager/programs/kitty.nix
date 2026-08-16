{ ... }: {
	programs.kitty = {
		enable = true;
		shellIntegration.enableFishIntegration = true;

		settings = {
			shell = "fish";

			font_family = "Monocraft";
			font_size = 10;
			cursor_trail = 1;
			foreground = "#ffceff";
			background = "#140014";
			background_opacity = 0.8;
		};
	};
}
