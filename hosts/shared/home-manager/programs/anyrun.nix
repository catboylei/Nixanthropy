{ pkgs, inputs, osConfig, ... }: {
	programs.anyrun = {
		enable = true;

		config = {
			x = {
				fraction = 0.5;
			};
			y = {
				fraction = 0.25;
			};
			width = {
				fraction = 0.25;
			};
			height = {
				absolute = 1;
			};
			layer = "overlay";
			closeOnClick = true;
			hidePluginInfo = true;
			showResultsImmediately = true;
			maxEntries = 10;

			plugins = [
				"${pkgs.anyrun}/lib/libapplications.so"
				"${pkgs.anyrun}/lib/librink.so"
				#"${pkgs.anyrun}/lib/libshell.so"
				#"${pkgs.anyrun}/lib/libkidex.so"
				#"${pkgs.anyrun}/lib/libsymbols.so"
				"${pkgs.anyrun}/lib/libnix_run.so"
				"${pkgs.anyrun}/lib/libniri_focus.so"
				inputs.anyrun-nixos-options.packages.${pkgs.stdenv.hostPlatform.system}.default
			];
		};

		extraCss = ''
      :root {
          --selected-bg-colour: #ffceff;
          --theme-bg-colour: rgba(20, 0, 20, 0.8);
          --text-colour: #ffceff;
      }

      * {
          color: var(--text-colour);
      }

      window {
          background: transparent;
      }

      box.main {
          padding: 5px;
          margin: 10px;
          border-radius: 10px;
          border: 2px solid var(--selected-bg-colour);
          background-color: var(--theme-bg-colour);
          box-shadow: 0 0 5px black;
          font-family: Monocraft;
          font-size: 16px;
      }

      text {
          min-height: 30px;
          padding: 5px;
          border-radius: 5px;
      }

      .matches {
          background-color: rgba(0, 0, 0, 0);
          border-radius: 10px;
      }

      box.plugin:first-child {
          margin-top: 5px;
      }

      box.plugin.info {
          min-width: 200px;
      }

      list.plugin {
          background-color: rgba(0, 0, 0, 0);
      }

      label.plugin.info {
          font-size: 12px;
      }

      .match {
          background: transparent;
      }

      .match:selected {
          border-left: 4px solid var(--selected-bg-colour);
          background: transparent;
          animation: fade 0.1s linear;
      }

      box.plugin:not(:first-child) {
          border-top: 1px solid var(--selected-bg-colour);
          margin-top: 5px;
          padding-top: 5px;
      }

      @keyframes fade {
          0% {
              opacity: 0;
          }

          100% {
              opacity: 1;
          }
      }
    '';

		extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        hide_description: true,
      )
    '';

		extraConfigFiles."symbols.ron".text = ''
      Config(
        prefix: ":sy",
        symbols: {
          // "name": "text to be copied"
        },
        max_entries: 5,
      )
    '';

		extraConfigFiles."nix-run.ron".text = ''
      Config(
        prefix: ":run",
        allow_unfree: true,
        channel: "nixpkgs-unstable",
        max_entries: 5,
      )
    '';

		extraConfigFiles."nixos-options.ron".text = let
			nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
			hm-options =
				inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.docs-json + "/share/doc/home-manager/options.json";

			options = builtins.toJSON {
				":nix" = [ nixos-options ];
				":hm" = [ hm-options ];
			};
		in ''
      Config(
          min_score: 0,
          options: ${options},
          max_entries: 3,
          strict_matching: true,
          url_color: "#ffceff",
          file_color: "#ffceff",
          match_color: "#ffceff"
      )
    '';
	};
}