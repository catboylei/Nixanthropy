{ ... }: {
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "catboylei";
				email = "243333633+catboylei@users.noreply.github.com";
			};

			init.defaultBranch = "main";
		};
	};
}
