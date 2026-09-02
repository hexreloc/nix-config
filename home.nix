{config, pkgs, ...}:

{
	imports = [
		./modules/home
	];
	home.username = "hex";
	home.homeDirectory = "/home/hex";
	home.packages = with pkgs;[
		alacritty
		firefox
		pavucontrol
		i3status
	];
	home.stateVersion = "25.11";
}
