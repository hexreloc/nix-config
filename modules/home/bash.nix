{
	programs.bash = {
		enable = true;
		shellAliases = {
          btw = "echo i use nixos btw";
          ff = "fastfetch";
		  nrs = "sudo nixos-rebuild switch --flake ~/nix-config#nixos-btw";
		};
        initExtra = ''
        export PS1='\[\e[38;5;149m\]\u\[\e[0m\] in \[\e[38;5;39m\]\w\[\e[0m\] \\$ '
        eval "$(fzf --bash)"

        vf() {
          local dir
          dir=$(find "$HOME" -type d -not -path '*/.*' 2>/dev/null | fzf) || return
          cd "$dir"
        }
        vn() {
          local file
          file=$(find "$HOME" -type f -not -path '*/.*' 2>/dev/null | fzf) || return
          nvim "$file"
        }
		'';
	};
}
