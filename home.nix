{pkgs, ...}:

{
	imports = [
		./modules/home
	];
	home.username = "hex";
	home.homeDirectory = "/home/hex";
	home.packages = with pkgs;[
		firefox #browser
		pavucontrol # volume control
        i3status-rust #statusbar rs impl
        feh # wallpaper
        zathura # pdf viewier
        digital # cicuit simulator
        discord
        obsidian
        ripgrep

        (pkgs.writeShellApplication {
          name = "ns";
          runtimeInputs = with pkgs; [
            fzf
            nix-search-tv
          ];
          text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
        })

      ];
      
	home.stateVersion = "25.11";
}
