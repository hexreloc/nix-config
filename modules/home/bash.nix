{
	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo i use nixos btw";
			nrs = "sudo nixos-rebuild switch --flake ~/nix-config#nixos-btw";
		};
		initExtra = ''
		export PS1='\[\e[38;5;149m\]\u\[\e[0m\] in \[\e[38;5;39m\]\w\[\e[0m\] \\$ '
		'';
	};
}
