{ pkgs, ... }: let 
	path = ".local/share/Steam/steamapps/common/Hollow Knight/hollow_knight_Data/Managed/Mods/CustomKnight";

	fox = pkgs.fetchzip {
		url = "https://skins.hk-modding.org/api/shares/foxbyunknown/files/03790ada-e6d0-484b-9103-665eb0a3376b";
		hash = "sha256-PU+bFc6WjMCePHEk1vYi19huS1JnIcZkrti6JdgxRo4=";
		extension = "zip";
	};
in {
	home.file."${path}/fox".source = fox;
}
