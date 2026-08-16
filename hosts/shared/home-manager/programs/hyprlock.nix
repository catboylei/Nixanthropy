{ ... }: {
	programs.hyprlock = {
		enable = true;

		settings = {
			general = {
				hide_cursor = true;
				ignore_empty_input = true;
			};

			background = [
				{
					path = "screenshot";
					noise = 0;
					blur_passes = 1;
					brightness = 1;
				}
			];

			input-field = [
				{
					size = "15%, 6%";
					outline_thickness = 2;
					dots_size = 0.35;
					dots_text_format = "󰏩";
					outer_color = "rgba(255, 206, 255, 1)";
					inner_color = "rgba(0, 0, 0, 0)";
					font_color = "rgba(255, 206, 255, 1)";
					fade_on_empty = false;
					placeholder_text = "<i>meow here :3</i>";
					rounding = 10;
					check_color = "rgba(255, 255, 255, 1)";
					fail_text = "<i>meow failed :c</i>";
					invert_numlock = true;
					zindex = 1;
				}
			];

			shape = [
				# background tint shape
				{
					size = "100%, 100%";
					color = "rgba(20, 0, 20, 0.8)";
				}
			];

			image = [
				{
					path = "/home/lei/.config/nixos/assets/icons/thetadelta-femboy.png";
					size = 200;
					rounding = 0;
					position = "0, 20%";
					border_size = 0;
				}
			];
		};
	};
}
