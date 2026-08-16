{ pkgs, self }:
pkgs.writeShellApplication {
	name = "awww_randomize";
	text = "dir=${self}/assets/wallpapers/\n" + builtins.readFile ./randomize.sh;
}
