{ self, ... }: {
	programs.niri = {
		#enable = true;

		settings = {
			spawn-at-startup = [
				{ argv = [ "anyrun" "daemon" ]; }
				{ argv = [ "awww-daemon" ]; }
				{ argv = [ "awww_randomize" ]; }
				{ argv = [ "paw-bar" ]; }
				{ argv = [ "hyprlock" ]; }
				# { argv = [ "kidex" ]; } # file index daemon for anyrun plugin
			];

			outputs = {
				eDP-1 = {
					mode = {
						height = 1920;
						width = 1080;
						refresh = 60.03000;
					};
				};
			};

			workspaces = {
				"6".name = "sixth";
				"5".name = "fifth";
				"4".name = "fourth";
				"3".name = "third";
				"2".name = "second";
				"1".name = "first";
			};

			prefer-no-csd = true;
			hotkey-overlay.skip-at-startup = true;
			screenshot-path = null;
			gestures.hot-corners.enable = false;

			layout = {
				border = {
					enable = true;

					width = 2;
					active.color = "#ffceff";
					inactive.color = "#505050";
				};

				focus-ring.enable = false; # i hate that thing
				shadow.enable = true;
				gaps = 8;
				default-column-width.proportion = 0.5;
			};

			window-rules = [
				{
					clip-to-geometry = true;
					geometry-corner-radius = let
						r = 12.0;
					in {
						top-left = r;
						top-right = r;
						bottom-left = r;
						bottom-right = r;
					};
					open-floating = false;
				}
				{
					matches = [
						{ app-id = "kitty"; }
						{ app-id = "xdg-desktop-portal-gtk"; }
					];

					open-floating = true;
					default-window-height.proportion = 0.5;
					default-column-width.proportion = 0.5;
				}
				{
					matches = [
						{ is-focused = false; }
						{ is-floating = true; }
					];

					opacity = 0.9;
				}
			];

			binds = {
				"Mod+Q".action.spawn = "kitty";
				"Mod+R".action.spawn = "anyrun";

				"Mod+Left".action.focus-column-left = {};
				"Mod+Right".action.focus-column-right = {};
				"Mod+Up".action.focus-workspace-up = {};
				"Mod+Down".action.focus-workspace-down = {};

				"Mod+Shift+Left".action.move-column-left = {};
				"Mod+Shift+Right".action.move-column-right = {};
				"Mod+Shift+Up".action.move-column-to-workspace-up = {};
				"Mod+Shift+Down".action.move-column-to-workspace-down = {};

				"Mod+C".action.close-window = {};
				"Mod+O".action.toggle-overview = {};
				"Mod+H".action.maximize-column = {};
				"Mod+Shift+H".action.expand-column-to-available-width = {};
				"Mod+G".action.fullscreen-window = {};
				"Mod+Minus".action.set-column-width = "-10%";
				"Mod+Equal".action.set-column-width = "+10%";
				"Mod+V".action.toggle-window-floating = {};
				"Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};
				"Print" = {
					allow-when-locked = true;
					#action.screenshot-screen = {};
					action.spawn-sh = "grim - | wl-copy";
				};
				"Shift+Print".action.screenshot = {};
				"Mod+E".action.quit = {};

				"XF86MonBrightnessUp".action.spawn = [
					"brightnessctl"
					"--class=backlight"
					"set"
					"+10%"
				];
				"XF86MonBrightnessDown".action.spawn = [
					"brightnessctl"
					"--class=backlight"
					"set"
					"10%-"
				];

				"XF86AudioRaiseVolume".action.spawn = [
					"wpctl"
					"set-volume"
					"@DEFAULT_AUDIO_SINK@"
					"0.1+"
				];
				"XF86AudioLowerVolume".action.spawn = [
					"wpctl"
					"set-volume"
					"@DEFAULT_AUDIO_SINK@"
					"0.1-"
				];
				"XF86AudioMute".action.spawn = [
					"set-mute"
					"@DEFAULT_AUDIO_SINK@"
					"toggle"
				];
				"XF86AudioMicMute".action.spawn = [
					"set-mute"
					"@DEFAULT_AUDIO_SOURCE@"
					"toggle"
				];

				"XF86AudioPlay".action.spawn = [
					"playerctl"
					"play-pause"
				];
				"XF86AudioStop".action.spawn = [
					"playerctl"
					"stop"
				];
				"XF86AudioPrev".action.spawn = [
					"playerctl"
					"previous"
				];
				"XF86AudioNext".action.spawn = [
					"playerctl"
					"next"
				];
			};
		};
	};
}
