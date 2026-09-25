{pkgs,inputs, ...}:

{
	imports = [
      ./modules/home
      inputs.zen-browser.homeModules.twilight
	];
	home.username = "hex";
    home.homeDirectory = "/home/hex";

    programs.zen-browser = {
      enable = true;
    };
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
        mission-center
        yazi
        brave # secondary browser
        fzf
        zed-editor #secondary text editor

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
