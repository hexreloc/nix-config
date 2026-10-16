{ pkgs, inputs, outputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  home.username = "hex";
  home.homeDirectory = "/home/hex";

  programs.zen-browser = {
    enable = true;
  };

 

  home.packages = with pkgs; [
    # minecraft
    temurin-bin
    libX11
    libXext
    libXi
    libXrender
    libXrandr
    libXxf86vm
    libXtst
    libxcb
    alsa-lib

    telegram-desktop
    spotify
    fd
    obsidian
    firefox
    pavucontrol
    i3status-rust
    feh
    zathura
    discord
    ripgrep
    mission-center
    yazi
    brave
    fzf
    vim
    gcc
    cmake
    python3
    obs-studio
    mpv
    nautilus
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.stateVersion = "25.11";
}
