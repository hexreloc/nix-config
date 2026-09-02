{config, pkgs, ...}:

{
	imports = [
		./modules/home
	];
	home.username = "hex";
	home.homeDirectory = "/home/hex";
	home.packages = with pkgs;[
		alacritty #alacritty
		firefox #browser
		pavucontrol # volume control
        i3status #statusbar
        feh # wallpaper
        zathura # pdf viewier
        digital # cicuit simulator
	];
	home.stateVersion = "25.11";
}
