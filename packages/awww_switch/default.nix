{ pkgs, self }:
pkgs.writeShellApplication {
	name = "awww_switch";
	text = "dir=${self}/assets/wallpapers/\n" + builtins.readFile ./switch.sh;
}
