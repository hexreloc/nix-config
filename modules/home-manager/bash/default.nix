{
  programs.bash = {
    enable = true;

    shellAliases = {
      btw = "echo i use nixos btw";
      v = "vim";
      steamrun = "nvidia-offload steam";
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config#nixos-btw";
      c = "clear";
    };

    initExtra = ''
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

  programs.starship = {
    enable = false;
    enableBashIntegration = false;
  };
}
