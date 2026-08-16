{ ... }: {
	services.greetd = {
		enable = true;

		settings = let
			initial_session = {
				command = "niri-session";
				user = "lei";
			};
		in {
			inherit initial_session;
			default_session = initial_session;
		};
	};
}