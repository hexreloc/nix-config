{
  programs.fish = {
    enable = true;

    shellAliases = {
      btw = "echo i use nixos btw";
      v = "vim";
      steamrun = "nvidia-offload steam";
      ff = "fastfetch";
      nrs = "sudo nixos-rebuild switch --flake ~/nix-config#nixos-btw";
      c = "clear";
    };

    interactiveShellInit = ''
      function vf
        set dir (find $HOME -type d -not -path '*/.*' 2>/dev/null | fzf)
        or return
        cd "$dir"
      end

      function vn
        set file (find $HOME -type f -not -path '*/.*' 2>/dev/null | fzf)
        or return
        nvim "$file"
      end
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}

