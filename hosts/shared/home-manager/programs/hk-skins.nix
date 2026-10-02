{ pkgs, lib, ... }: let
	path = ".local/share/Steam/steamapps/common/Hollow\ Knight/hollow_knight_Data/Managed/Mods/Custom\ Knight/Skins";

	fox = pkgs.fetchzip {
		url = "https://skins.hk-modding.org/api/shares/foxbyunknown/files/03790ada-e6d0-484b-9103-665eb0a3376b";
		hash = "sha256-PU+bFc6WjMCePHEk1vYi19huS1JnIcZkrti6JdgxRo4=";
		extension = "zip";
	};
in {
	# home.file."${path}/fox".source = fox; # apparently symlinks make it crash lmao

	# stupidddd
	home.activation.hollowKnightFox = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
		dest="$HOME/${path}/fox"
		rm -rf "$dest"
		mkdir -p "$dest"
		cp -rL ${fox}/. "$dest"/
		chmod -R u+w "$dest"
	'';
}
